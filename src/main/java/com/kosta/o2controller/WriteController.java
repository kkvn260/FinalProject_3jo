package com.kosta.o2controller;


import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kosta.o2dto.MobileVO;
import com.kosta.o2dto.O2DealDTO;
import com.kosta.o2dto.O2DongComDTO;
import com.kosta.o2dto.O2FileDTO;
import com.kosta.o2dto.O2LikeDTO;
import com.kosta.o2dto.O2QnaBoardDTO;
import com.kosta.o2dto.O2ReplyDTO;
import com.kosta.o2dto.O2WriteBoardDTO;
import com.kosta.o2writeservice.O2WriteService;


@Controller
public class WriteController {

	@Autowired
	private O2WriteService service;

	@RequestMapping("/write")
	public String twrite(HttpSession session,Model model) {
		String id=(String)session.getAttribute("user_id");
		model.addAttribute("id",id);
		return "writeboard/twrite";
	}
	
	@RequestMapping("/dwrite")
	public String dwrite(HttpSession session,Model model) {
		String id=(String)session.getAttribute("user_id");
		model.addAttribute("id",id);
		return "writeboard/dwrite";
	}
	
	@RequestMapping("/qwrite")
	public String qwrite(HttpSession session,Model model) {
		String id=(String)session.getAttribute("user_id");
		model.addAttribute("id",id);
		return "writeboard/qwrite";
	}

	private static final long LIMIT_SIZE = 10 * 1024 * 1024;
	
	//twriteresult
	@PostMapping("/twriteresult")
	public String twriteresult(O2WriteBoardDTO dto
								,@RequestParam("filedata")List<MultipartFile> images
								,HttpServletRequest request) {
		
		long sizeSum = 0;
		for(MultipartFile image : images) {
			//용량 검사
			sizeSum += image.getSize();
			if(sizeSum >= LIMIT_SIZE) {
				
				return "writboard/fail";
			}
		}
		service.twriteinsert(dto,images);
		String root_path = request.getSession().getServletContext().getRealPath("/"); 
		String attach_path = "resources/img/";
		 for (MultipartFile mf : images) {
	            String fileName = mf.getOriginalFilename(); // 원본 파일 명

	            String safeFile = root_path + attach_path + fileName;
	            try {
	                mf.transferTo(new File(safeFile));
	            } catch (IllegalStateException e) {
	                // TODO Auto-generated catch block
	                e.printStackTrace();
	            } catch (IOException e) {
	                // TODO Auto-generated catch block
	                e.printStackTrace();
	            }
	        }

		return "redirect:/selllist";
	}
	
	@PostMapping("/dwriteresult")
	public String dwriteresult(O2DongComDTO dto
								,@RequestParam("filedata")List<MultipartFile> images
								,HttpServletRequest request) {
		
		long sizeSum = 0;
		for(MultipartFile image : images) {
			//용량 검사
			sizeSum += image.getSize();
			if(sizeSum >= LIMIT_SIZE) {
				
				return "writboard/fail";
			}
		}
		service.dwriteinsert(dto,images);
		String root_path = request.getSession().getServletContext().getRealPath("/"); 
		String attach_path = "resources/img/";
		 for (MultipartFile mf : images) {
	            String fileName = mf.getOriginalFilename(); // 원본 파일 명

	            System.out.println("originFileName : " + fileName);

	            String safeFile = root_path + attach_path + fileName;
	            System.out.println(safeFile);
	            try {
	                mf.transferTo(new File(safeFile));
	            } catch (IllegalStateException e) {
	                // TODO Auto-generated catch block
	                e.printStackTrace();
	            } catch (IOException e) {
	                // TODO Auto-generated catch block
	                e.printStackTrace();
	            }
	        }

		return "redirect:/dongcomlist";
	}
	
	@PostMapping("/qwriteresult")
	public String qwriteresult(O2QnaBoardDTO dto
								,@RequestParam("filedata")List<MultipartFile> images
								,HttpServletRequest request) {
		
		long sizeSum = 0;
		for(MultipartFile image : images) {
			//용량 검사
			sizeSum += image.getSize();
			if(sizeSum >= LIMIT_SIZE) {
				
				return "writboard/fail";
			}
		}
		service.qwriteinsert(dto,images);
		String root_path = request.getSession().getServletContext().getRealPath("/"); 
		String attach_path = "resources/img/";
		 for (MultipartFile mf : images) {
	            String fileName = mf.getOriginalFilename(); // 원본 파일 명

	            System.out.println("originFileName : " + fileName);

	            String safeFile = root_path + attach_path + fileName;
	            System.out.println(safeFile);
	            try {
	                mf.transferTo(new File(safeFile));
	            } catch (IllegalStateException e) {
	                // TODO Auto-generated catch block
	                e.printStackTrace();
	            } catch (IOException e) {
	                // TODO Auto-generated catch block
	                e.printStackTrace();
	            }
	        }

		return "redirect:/qnalist";
	}

	@RequestMapping("/twritedetail/{no}")
	public String twritedetail(Model model,@PathVariable int no,HttpSession session) {
		
		O2WriteBoardDTO list= service.twritedetail(no);
		List<O2FileDTO> list2=service.tfiledetail(no);
		String id=(String)session.getAttribute("user_id");
		List<O2ReplyDTO> list3=service.treplydetail(no);
		O2LikeDTO check=new O2LikeDTO(id,no);
		O2LikeDTO result=service.tlikecheck2(check);
		
		model.addAttribute("id",id);
		model.addAttribute("list",list);
		model.addAttribute("list2",list2);
		model.addAttribute("list3",list3);
		model.addAttribute("result",result);
		
		return "writeboard/twritedetail";
	}
	
	@RequestMapping("/dwritedetail/{no}")
	public String dwritedetail(Model model,@PathVariable int no,HttpSession session) {
		
		O2DongComDTO list= service.dwritedetail(no);
		List<O2FileDTO> list2=service.dfiledetail(no);
		String id=(String)session.getAttribute("user_id");
		List<O2ReplyDTO> list3=service.dreplydetail(no);
		O2LikeDTO check=new O2LikeDTO(id,no);
		O2LikeDTO result=service.dlikecheck2(check);
		
		model.addAttribute("id",id);
		model.addAttribute("list",list);
		model.addAttribute("list2",list2);
		model.addAttribute("list3",list3);
		model.addAttribute("result",result);
		System.out.println(result.getUser_id());
		return "writeboard/dwritedetail";
	}
	
	@RequestMapping("/qwritedetail/{no}")
	public String qwritedetail(Model model,@PathVariable int no,HttpSession session) {
		
		O2QnaBoardDTO list= service.qwritedetail(no);
		List<O2FileDTO> list2=service.qfiledetail(no);
		String id=(String)session.getAttribute("user_id");
		List<O2ReplyDTO> list3=service.qreplydetail(no);
		
		model.addAttribute("id",id);
		model.addAttribute("list",list);
		model.addAttribute("list2",list2);
		model.addAttribute("list3",list3);
		
		
		return "writeboard/qwritedetail";
	}
	

	
	@RequestMapping("/tdealdetail/{no}")
	public String tdealdetail(Model model,@PathVariable int no,HttpSession session) {

		O2WriteBoardDTO list= service.twritedetail(no);
		List<O2FileDTO> list2=service.tfiledetail(no);
		String price=service.getprice(no);
		String id=(String)session.getAttribute("user_id");
		List<O2ReplyDTO> list3=service.treplydetail(no);
		O2LikeDTO check=new O2LikeDTO(id,no);
		O2LikeDTO result=service.tlikecheck2(check);
		
		model.addAttribute("id",id);
		model.addAttribute("price",price);
		model.addAttribute("list",list);
		model.addAttribute("list2",list2);
		model.addAttribute("list3",list3);
		model.addAttribute("result",result);
		
		return "writeboard/dealdetail";
	}
	
	@RequestMapping("twritedelete/{no}")
	public String twritedelete(@PathVariable int no) {
		service.twritedelete(no);
		return "redirect:/selllist";
	}
	
	@RequestMapping("dwritedelete/{no}")
	public String dwritedelete(@PathVariable int no) {
		service.dwritedelete(no);
		return "redirect:/dongcomlist";
	}
	
	@RequestMapping("qwritedelete/{no}")
	public String qwritedelete(@PathVariable int no) {
		service.qwritedelete(no);
		return "redirect:/qnalist";
	}
	
	@RequestMapping("twritemodify/{no}")
	public String twritemodfiy(@PathVariable int no,Model model) {
		O2WriteBoardDTO list= service.twritedetail(no);
		List<O2FileDTO> list2=service.tfiledetail(no);
		
		model.addAttribute("list",list);
		model.addAttribute("list2",list2);
		return "writeboard/twritemodify";
	}
	
	@RequestMapping("tdealmodify/{no}")
	public String tdealmodfiy(@PathVariable int no,Model model) {
		O2WriteBoardDTO list= service.twritedetail(no);
		List<O2FileDTO> list2=service.tfiledetail(no);
		String price=service.getprice(no);
		
		model.addAttribute("price",price);
		model.addAttribute("list",list);
		model.addAttribute("list2",list2);
		return "writeboard/tdealmodify";
	}
	
	@RequestMapping("dwritemodify/{no}")
	public String dwritemodfiy(@PathVariable int no,Model model) {
		O2DongComDTO list= service.dwritedetail(no);
		List<O2FileDTO> list2=service.dfiledetail(no);
		
		model.addAttribute("list",list);
		model.addAttribute("list2",list2);
		return "writeboard/dwritemodify";
	}
	
	@RequestMapping("qwritemodify/{no}")
	public String qwritemodfiy(@PathVariable int no,Model model) {
		O2QnaBoardDTO list= service.qwritedetail(no);
		List<O2FileDTO> list2=service.qfiledetail(no);
		
		model.addAttribute("list",list);
		model.addAttribute("list2",list2);
		return "writeboard/qwritemodify";
	}
	
	@RequestMapping("twritemodifyresult")
	public String twritemodifyresult(O2WriteBoardDTO dto
									,@RequestParam("filedata")List<MultipartFile> images
									,HttpServletRequest request) {
		long sizeSum = 0;
		for(MultipartFile image : images) {
			//용량 검사
			sizeSum += image.getSize();
			if(sizeSum >= LIMIT_SIZE) {
				
				return "writboard/fail";
			}
		}
		service.twritemodifyresult(dto,images);
		
		String root_path = request.getSession().getServletContext().getRealPath("/"); 
		String attach_path = "resources/img/";
		 for (MultipartFile mf : images) {
	            String fileName = mf.getOriginalFilename(); // 원본 파일 명
	            String safeFile = root_path + attach_path + fileName;
	            
	            try {
	                mf.transferTo(new File(safeFile));
	            } catch (IllegalStateException e) {
	                // TODO Auto-generated catch block
	                e.printStackTrace();
	            } catch (IOException e) {
	                // TODO Auto-generated catch block
	                e.printStackTrace();
	            }
	        }
		return "redirect:/twritedetail/"+dto.getTradeno();
	}
	
	@RequestMapping("dwritemodifyresult")
	public String dwritemodifyresult(O2DongComDTO dto
									,@RequestParam("filedata")List<MultipartFile> images
									,HttpServletRequest request) {
		long sizeSum = 0;
		for(MultipartFile image : images) {
			//용량 검사
			sizeSum += image.getSize();
			if(sizeSum >= LIMIT_SIZE) {
				
				return "writboard/fail";
			}
		}

		service.dwritemodifyresult(dto,images);
		
		String root_path = request.getSession().getServletContext().getRealPath("/"); 
		String attach_path = "resources/img/";
		 for (MultipartFile mf : images) {
	            String fileName = mf.getOriginalFilename(); // 원본 파일 명

	            String safeFile = root_path + attach_path + fileName;
	            try {
	                mf.transferTo(new File(safeFile));
	            } catch (IllegalStateException e) {
	                // TODO Auto-generated catch block
	                e.printStackTrace();
	            } catch (IOException e) {
	                // TODO Auto-generated catch block
	                e.printStackTrace();
	            }
	        }
		return "redirect:/dwritedetail/"+dto.getChatno();
	}
	
	@RequestMapping("qwritemodifyresult")
	public String qwritemodifyresult(O2QnaBoardDTO dto
									,@RequestParam("filedata")List<MultipartFile> images
									,HttpServletRequest request) {
		long sizeSum = 0;
		for(MultipartFile image : images) {
			//용량 검사
			sizeSum += image.getSize();
			if(sizeSum >= LIMIT_SIZE) {
				
				return "writboard/fail";
			}
		}

		service.qwritemodifyresult(dto,images);
		
		String root_path = request.getSession().getServletContext().getRealPath("/"); 
		String attach_path = "resources/img/";
		 for (MultipartFile mf : images) {
	            String fileName = mf.getOriginalFilename(); // 원본 파일 명

	            String safeFile = root_path + attach_path + fileName;
	            try {
	                mf.transferTo(new File(safeFile));
	            } catch (IllegalStateException e) {
	                // TODO Auto-generated catch block
	                e.printStackTrace();
	            } catch (IOException e) {
	                // TODO Auto-generated catch block
	                e.printStackTrace();
	            }
	        }
		return "redirect:/qwritedetail/"+dto.getQnano();
	}
	
	@RequestMapping("fail")
	public String fail() {
		return "writeboard/fail";
	}
	
	@ResponseBody
	@PostMapping("/deal/{no}/{no2}")
	public Object deal(@RequestBody O2DealDTO dto,@PathVariable int no,@PathVariable int no2) {
		
		if(no2>no) {
				service.dealinsert(dto);
		}
		Object result=service.getprice(dto.getTradeno());
		return result;
	}
	
	@RequestMapping("treplyresult")
	public String treplyresult(O2ReplyDTO dto) {
		service.treplyinsert(dto);
		
		return "redirect:/twritedetail/"+dto.getTradeno();
	}
	@RequestMapping("tdreplyresult")
	public String tdreplyresult(O2ReplyDTO dto) {
		service.treplyinsert(dto);
		
		return "redirect:/tdealdetail/"+dto.getTradeno();
	}
	
	@RequestMapping("treplychild")
	@ResponseBody
	public O2ReplyDTO treplychild(@RequestBody O2ReplyDTO dto) {
		O2ReplyDTO result=service.treplychild(dto);
		
		return result;
	}
	
	@RequestMapping("treplychildinsert")
	public String treplychildinsert(O2ReplyDTO dto) {
		service.treplychildinsert(dto);
		return "redirect:/twritedetail/"+dto.getTradeno();
	}
	
	@RequestMapping("dreplyresult")
	public String dreplyresult(O2ReplyDTO dto) {
		service.dreplyinsert(dto);
		
		return "redirect:/dwritedetail/"+dto.getChatno();
	}
	
	@RequestMapping("dreplychild")
	@ResponseBody
	public O2ReplyDTO dreplychild(@RequestBody O2ReplyDTO dto) {
		O2ReplyDTO result=service.dreplychild(dto);
		
		return result;
	}
	
	@RequestMapping("dreplychildinsert")
	public String dreplychildinsert(O2ReplyDTO dto) {
		service.dreplychildinsert(dto);
		return "redirect:/dwritedetail/"+dto.getChatno();
	}
	
	@RequestMapping("qreplyresult")
	public String qreplyresult(O2ReplyDTO dto) {
		service.qreplyinsert(dto);
		
		return "redirect:/qwritedetail/"+dto.getQnano();
	}
	
	@RequestMapping("qreplychild")
	@ResponseBody
	public O2ReplyDTO qreplychild(@RequestBody O2ReplyDTO dto) {
		O2ReplyDTO result=service.qreplychild(dto);
		
		return result;
	}
	
	@RequestMapping("qreplychildinsert")
	public String qreplychildinsert(O2ReplyDTO dto) {
		service.qreplychildinsert(dto);
		return "redirect:/qwritedetail/"+dto.getQnano();
	}
	
	@RequestMapping("treplydelete/{no}/{no2}")
	public String treplydelete(@PathVariable int no,@PathVariable int no2) {
		service.treplydelete(no);
		return "redirect:/twritedetail/"+no2;
	}
	
	@RequestMapping("dreplydelete/{no}/{no2}")
	public String dreplydelete(@PathVariable int no,@PathVariable int no2) {
		service.dreplydelete(no);
		return "redirect:/dwritedetail/"+no2;
	}
	
	@RequestMapping("qreplydelete/{no}/{no2}")
	public String qreplydelete(@PathVariable int no,@PathVariable int no2) {
		service.qreplydelete(no);
		return "redirect:/qwritedetail/"+no2;
	}
	
	@RequestMapping("treplydelete2/{no}/{no2}")
	public String treplydelete2(@PathVariable int no,@PathVariable int no2) {
		service.treplydelete2(no);
		return "redirect:/twritedetail/"+no2;
	}
	
	@RequestMapping("dreplydelete2/{no}/{no2}")
	public String dreplydelete2(@PathVariable int no,@PathVariable int no2) {
		service.dreplydelete2(no);
		return "redirect:/dwritedetail/"+no2;
	}
	
	@RequestMapping("qreplydelete2/{no}/{no2}")
	public String qreplydelete2(@PathVariable int no,@PathVariable int no2) {
		service.qreplydelete2(no);
		return "redirect:/qwritedetail/"+no2;
	}
	
	@PostMapping("tlike")
	@ResponseBody
	public List<Integer> tlike(@RequestBody O2LikeDTO dto) {
		O2LikeDTO result=service.tlikecheck(dto);
		int t=1;
		if(result==null) {
			t=0;
			service.tlikeinsert(dto);
			service.tlikecount(dto);
		}else {
			service.tlikedelete(dto);
			service.tlikecountdel(dto);
		}
		int total=service.tliketotal(dto.getTradeno());
		List<Integer> list=new ArrayList<Integer>();
		list.add(t);
		list.add(total);
		return list;
	}
	
	@PostMapping("dlike")
	@ResponseBody
	public List<Integer> dlike(@RequestBody O2LikeDTO dto) {
		O2LikeDTO result=service.dlikecheck(dto);
		int t = 1;
		if(result==null) {
			t=0;
			service.dlikeinsert(dto);
			service.dlikecount(dto);
		}else {
			service.dlikedelete(dto);
			service.dlikecountdel(dto);
		}
		int total=service.dliketotal(dto.getChatno());
		List<Integer> list=new ArrayList<Integer>();
		list.add(t);
		list.add(total);
		return list;
	}
	
	@RequestMapping("getPriceData")
	@ResponseBody
	public HashMap<String, Integer> getPriceData(@RequestParam  HashMap<String, String>  hm) {
		
		String category = (String)hm.get("category");
		String itemProd = (String)hm.get("itemProd");
		
		HashMap<String, Integer> priceList=null;
		
		if(itemProd!=null || itemProd!="")
			priceList = service.getPriceData(category,itemProd);
				
		return priceList;
	}
	
}

