package carbon.dto;

import lombok.Data;

@Data
public class PageDto {
	/* 시작 페이지 */
	Integer startPage;
	/* 끝 페이지 */
	Integer endPage;
	/* 이전 페이지, 다음 페이지 존재유무 */
	Boolean prev, next;
	/*전체 게시물 수*/
	Integer total;
	
	
}
