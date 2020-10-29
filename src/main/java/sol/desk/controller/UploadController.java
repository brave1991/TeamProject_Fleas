package sol.desk.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;
import sol.desk.domain.AttachFileDTO;

@Controller
@Log4j
public class UploadController {
	

	@GetMapping("/uploadAjax")
	public void uploadAjax() {
		System.out.println("upload ajax");
	}
	private String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = sdf.format(date);
		return str.replace("-",File.separator);
	}
	
	
	@PostMapping(value="/uploadAjaxAction",produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<AttachFileDTO>> 
	uploadAjaxPost(MultipartFile[] uploadFile) {
		System.out.println("controlerrrrrr uploadajaxaction!!!!enter!!!!!");
		List<AttachFileDTO> list=new ArrayList<>();                                                            
		String uploadFolder ="C:\\Users\\soldesk\\Desktop\\upload";
		
		String uploadFolderPath = getFolder();
		File uploadPath = new File(uploadFolder,uploadFolderPath);
		log.info("upload path:" +uploadPath);
		
		if(uploadPath.exists()==false) {
			uploadPath.mkdirs();
		}
		
		for(MultipartFile multipartFile : uploadFile) {
			//log.info("-----------");
			//log.info("Upload file name"+multipartFile.getOriginalFilename());
			//log.info("upload file size"+multipartFile.getSize());
			
			AttachFileDTO attachDTO = new AttachFileDTO();
			
			String uploadFileName = multipartFile.getOriginalFilename();
			
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\")+1);
			
			log.info("only file name"+uploadFileName);
			
			attachDTO.setFileName(uploadFileName);
			
			UUID uuid=UUID.randomUUID();
			
			uploadFileName = uuid.toString()+ "_"+uploadFileName;
			
			try {
				File saveFile = new File(uploadPath,uploadFileName);
				multipartFile.transferTo(saveFile);
				
				attachDTO.setUuid(uuid.toString());
				attachDTO.setUploadPath(uploadFolderPath);
				
				if(checkImageType(saveFile)) {
					attachDTO.setImage(true);
					FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath,"s_"+uploadFileName));
					Thumbnailator.createThumbnail(multipartFile.getInputStream(),thumbnail,100,100);
					thumbnail.close();
				}
				list.add(attachDTO);
			} catch (Exception e) {
				// TODO: handle exception
				log.error(e.getMessage());
			}
		}
		return new ResponseEntity<>(list, HttpStatus.OK);
	}
	
	private boolean checkImageType(File file) {
		try {
			String contentType=Files.probeContentType(file.toPath());
			return contentType.startsWith("image");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return false;
	}
	
	
	@GetMapping("/display")
	@ResponseBody
	public ResponseEntity<byte[]> getFile(String fileName){
		log.info("fileName"+fileName);
		File file = new File("C:\\Users\\soldesk\\Desktop\\upload\\"+fileName);
		log.info("file"+file);
		ResponseEntity<byte[]> result=null;
		try {
			HttpHeaders header = new HttpHeaders();
			
			header.add("Content-Type", Files.probeContentType(file.toPath()));
			result=new ResponseEntity<>(FileCopyUtils.copyToByteArray(file),
					header,HttpStatus.OK);
		} catch (IOException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return result;
	}
	
	
	@GetMapping(value="/download",produces=MediaType.APPLICATION_OCTET_STREAM_VALUE)
	@ResponseBody
	public ResponseEntity<Resource> downloadFile(@RequestHeader("User-Agent") String userAgent,String fileName){
		//System.out.println("download file"+fileName);
		
		Resource resource = new FileSystemResource("C:\\Users\\soldesk\\Desktop\\upload"+fileName);
		
		if(resource.exists() ==false) {
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		
		
		//System.out.println("resource"+resource);
		
		String resourceName=resource.getFilename();
		
		String resourceOriginalName = resourceName.substring(resourceName.indexOf("_")+1);
		
		HttpHeaders headers=new HttpHeaders();
		
		try {
			String downloadName=null;
			
			if(userAgent.contains("Trident")) {
				System.out.println("IE browser");
				downloadName=URLEncoder.encode(resourceOriginalName,"UTF-8").replaceAll("\\", " ");
			}else if(userAgent.contains("Edge")) {
				System.out.println("Edge browser");
				downloadName = URLEncoder.encode(resourceOriginalName,"UTF-8");
			}else {
				System.out.println("Chrome browser");
				downloadName=new String(resourceOriginalName.getBytes("UTF-8"),"ISO-8859-1");
			}
			System.out.println("downloadName"+downloadName);
			
			headers.add("Content-Disposition", "attachment; filename="+downloadName);
		} catch (UnsupportedEncodingException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return new ResponseEntity<Resource>(resource,headers,HttpStatus.OK);
	}
	
	
	@PostMapping("/deleteFile")
	@ResponseBody
	public ResponseEntity<String> deleteFile(String fileName, String type) {

		log.info("deleteFile: " + fileName);

		File file;

		try {
			file = new File("C:\\Users\\soldesk\\Desktop\\upload" + URLDecoder.decode(fileName, "UTF-8"));

			file.delete();

			if (type.equals("image")) {

				String largeFileName = file.getAbsolutePath().replace("s_", "");

				log.info("largeFileName: " + largeFileName);

				file = new File(largeFileName);

				file.delete();
			}

		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}

		return new ResponseEntity<String>("deleted", HttpStatus.OK);

	}
}
