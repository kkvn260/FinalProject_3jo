package com.kosta.o2dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.web.multipart.MultipartFile;

import com.kosta.o2dto.ItemPriceVO;
import com.kosta.o2dto.MobileVo;
import com.kosta.o2dto.O2DealDTO;
import com.kosta.o2dto.O2DongComDTO;
import com.kosta.o2dto.O2FileDTO;
import com.kosta.o2dto.O2LikeDTO;
import com.kosta.o2dto.O2MainBoardDTO;
import com.kosta.o2dto.O2QnaBoardDTO;
import com.kosta.o2dto.O2ReplyDTO;
import com.kosta.o2dto.O2WriteBoardDTO;

@Mapper
public interface O2WriteDAO {


	void twriteinsert(O2WriteBoardDTO dto);

	O2WriteBoardDTO twritedetail(int no); 

	List<O2WriteBoardDTO> topviewlist();

	List<O2QnaBoardDTO> getqlist();

	int sellCount(HashMap<String, Object> hm);

	List<O2MainBoardDTO> getmlist(HashMap<String, Object> hm);

	void tinsertfile(O2FileDTO file);

	List<O2WriteBoardDTO> selllist();

	List<O2DongComDTO> getdonglist();

	List<O2WriteBoardDTO> deallist();

	List<O2FileDTO> tfiledetail(int no);

	void twritedelete(int no);

	void twritemodifyresult(O2WriteBoardDTO dto);

	void tfiledelete(int no);

	void dwriteinsert(O2DongComDTO dto);

	void dinsertfile(O2FileDTO file);

	O2DongComDTO dwritedetail(int no);

	List<O2FileDTO> dfiledetail(int no);

	void dwritedelete(int no);

	void dwritemodifyresult(O2DongComDTO dto);

	void dfiledelete(int no);

	void qwriteinsert(O2QnaBoardDTO dto);

	void qinsertfile(O2FileDTO file);

	O2QnaBoardDTO qwritedetail(int no);

	List<O2FileDTO> qfiledetail(int no);

	void qwritedelete(int no);

	void qwritemodifyresult(O2QnaBoardDTO dto);

	void qfiledelete(int no);

	List<O2DongComDTO> dongtopviewlist();
	
	void dealinsert(O2DealDTO dto);

	void dealinsert2(O2WriteBoardDTO dto);

	String getprice(int tradeno);

	List<O2MainBoardDTO> sellList(HashMap<String, Object> hm);

	int dealCount(HashMap<String, Object> hm);

	List<O2MainBoardDTO> dealList(HashMap<String, Object> hm);

	List<O2ReplyDTO> treplydetail(int no);

	void treplyinsert(O2ReplyDTO dto);

	O2ReplyDTO treplychild(O2ReplyDTO dto);

	void treplychildinsert(O2ReplyDTO dto);

	void treplyupdate(O2ReplyDTO dto);

	void twritecount(int no);

	List<O2ReplyDTO> dreplydetail(int no);

	List<O2ReplyDTO> qreplydetail(int no);

	void dreplyinsert(O2ReplyDTO dto);

	void dreplyupdate(O2ReplyDTO dto);

	O2ReplyDTO dreplychild(O2ReplyDTO dto);

	void dreplychildinsert(O2ReplyDTO dto);

	void qreplyinsert(O2ReplyDTO dto);

	void qreplyupdate(O2ReplyDTO dto);

	O2ReplyDTO qreplychild(O2ReplyDTO dto);

	void qreplychildinsert(O2ReplyDTO dto);

	void qwritecount(int no);

	void dwritecount(int no);

	void dealdelete(String user_id);

	void treplydelete(int no);

	void dreplydelete(int no);

	void qreplydelete(int no);

	void treplydelete2(int no);

	void dreplydelete2(int no);

	void qreplydelete2(int no);

	void tlikeinsert(O2LikeDTO dto);

	O2LikeDTO tlikecheck(O2LikeDTO dto);

	O2LikeDTO tlikecheck2(O2LikeDTO check);

	void tlikedelete(O2LikeDTO dto);

	O2LikeDTO dlikecheck(O2LikeDTO dto);

	O2LikeDTO dlikecheck2(O2LikeDTO check);

	void dlikeinsert(O2LikeDTO dto);

	void dlikedelete(O2LikeDTO dto);

	void tlikecount(O2LikeDTO dto);

	void tlikecountdel(O2LikeDTO dto);

	void dlikecount(O2LikeDTO dto);

	void dlikecountdel(O2LikeDTO dto);

	List<String> searchSellCount(HashMap<String, Object> hm);

	List<String> searchDealCount(HashMap<String, Object> hm);

	void addSearchData(List<String> category);

	List<String> getTopSearch();

	void removeSearchData();

	void dealdelete2(int no);

	int getMobileData(List<MobileVo> mobileList);

	int tliketotal(int tradeno);

	int dliketotal(int chatno);

	List<O2WriteBoardDTO> maillist();

	O2DealDTO dealresult(int tradeno);

	String getmail(String user_id);

	List<ItemPriceVO> getPriceData(HashMap<String, Object> hm);	
	
}
