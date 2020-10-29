package sol.desk.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sol.desk.board.service.ListArticleService;
import sol.desk.mvc.command.CommandHandler;

public class ListArticleHandler implements CommandHandler {

	
private ListArticleService listArticleService = new ListArticleService();
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String pageNum = request.getParameter("page");
		String sort = request.getParameter("sort");
		
		int page = 1;
		
		if(pageNum != null) {
			page = Integer.parseInt(pageNum);
		}
		
		ArticlePage articlePage = listArticleService.getArticlePage(page, sort);
		request.setAttribute("articlePage", articlePage);
		
		return "/WEB-INF/board/listArticle.jsp";
	}
}
