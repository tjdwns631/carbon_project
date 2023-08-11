package carbon.dto;


import java.sql.Timestamp;

import lombok.Data;

@Data
public class BoardDto {

	Integer board_idx; //일련번호
	String board_title; // 글 제목
	String board_content; // 글 내용
	Integer cate_idx; // 글 카테고리
	String board_pwd; // 글 비밀번호(삭제시)
	Integer member_idx; // 작성자
	Integer board_hits; // 조회수
	Timestamp board_date; // 등록날일자
	Timestamp board_upd; // 수정일자
	 
	Tb_categoryDto tb_categorydto;
	MemberDto memberdto;
	
}
