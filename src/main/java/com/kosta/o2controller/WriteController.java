package com.kosta.o2controller;





import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kosta.o2dto.O2DealDTO;
import com.kosta.o2dto.O2DongComDTO;
import com.kosta.o2dto.O2FileDTO;
import com.kosta.o2dto.O2MainBoardDTO;
import com.kosta.o2dto.O2Page;
import com.kosta.o2dto.O2QnaBoardDTO;
import com.kosta.o2dto.O2ReplyDTO;
import com.kosta.o2dto.O2WriteBoardDTO;
import com.kosta.o2service.O2Service;
import com.kosta.o2writeservice.O2WriteService;


@Controller
public class WriteController {

	@Autowired
	private O2WriteService service;
	
	@Autowired
	private O2Service o2service;

	@RequestMapping("/write")
	public String twrite(HttpSession session,Model model) {
		//아이디 가져와서 가입할때 주소 받기 >> 지도에 뿌림
		String id=(String)session.getAttribute("user_id");
		model.addAttribute("id",id);
		return "writeboard/twrite";
	}
	@RequestMapping("/dwrite")
	public String dwrite() {
		//아이디 가져와서 가입할때 주소 받기 >> 지도에 뿌림

		return "writeboard/dwrite";
	}
	
	@RequestMapping("/qwrite")
	public String qwrite() {
		//아이디 가져와서 가입할때 주소 받기 >> 지도에 뿌림

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
		
		model.addAttribute("id",id);
		model.addAttribute("list",list);
		model.addAttribute("list2",list2);
		model.addAttribute("list3",list3);
		
		return "writeboard/twritedetail";
	}
	
	@RequestMapping("/dwritedetail/{no}")
	public String dwritedetail(Model model,@PathVariable int no,HttpSession session) {
		
		O2DongComDTO list= service.dwritedetail(no);
		List<O2FileDTO> list2=service.dfiledetail(no);
		String id=(String)session.getAttribute("user_id");
		
		model.addAttribute("id",id);
		model.addAttribute("list",list);
		model.addAttribute("list2",list2);
		
		return "writeboard/dwritedetail";
	}
	
	@RequestMapping("/qwritedetail/{no}")
	public String qwritedetail(Model model,@PathVariable int no,HttpSession session) {
		
		O2QnaBoardDTO list= service.qwritedetail(no);
		List<O2FileDTO> list2=service.qfiledetail(no);
		String id=(String)session.getAttribute("user_id");
		
		model.addAttribute("id",id);
		model.addAttribute("list",list);
		model.addAttribute("list2",list2);
		
		return "writeboard/qwritedetail";
	}
	
	@RequestMapping("/selllist")
	public String sellList(@RequestParam(required = false, defaultValue = "1") int currPage,
			@RequestParam(required = false, defaultValue = "") String search,
			@RequestParam(required = false, defaultValue = "") String searchtxt,Model model) {
		
		Pattern pattern = Pattern.compile("(^[0-9]*$)");

		if (search == "user_id" || search.equals("user_id") || search == "title"
			|| search.equals("title") || search == "content" || search.equals("content")) 
		{
			Matcher matcher = pattern.matcher(searchtxt);
			if (matcher.find()) {
				model.addAttribute("searchtxt", searchtxt);
			} else {
				model.addAttribute("searchtxt", "");
			}
		}
		
		int totalCount = o2service.sellCount(search, searchtxt);
		int pageSize=10;
		int blockSize=5;
		
		O2Page page = new O2Page(currPage, totalCount, pageSize, blockSize);
		List<O2MainBoardDTO> list= o2service.sellList(search, searchtxt, page.getStartRow(), pageSize);
		
		model.addAttribute("list",list);
		model.addAttribute("page",page);
		model.addAttribute("search",search);
		model.addAttribute("searchtxt",searchtxt);
		 
		return "writeboard/selllist";
	}
	
	
	
	@RequestMapping("/deallist")
	public String deallist(@RequestParam(required = false, defaultValue = "1") int currPage,
			@RequestParam(required = false, defaultValue = "") String search,
			@RequestParam(required = false, defaultValue = "") String searchtxt,
			Model model) 
	{
		
		Pattern pattern = Pattern.compile("(^[0-9]*$)");

		if (search == "user_id" || search.equals("user_id") || search == "title"
			|| search.equals("title") || search == "content" || search.equals("content")) 
		{
			Matcher matcher = pattern.matcher(searchtxt);
			if (matcher.find()) {
				model.addAttribute("searchtxt", searchtxt);
			} else {
				model.addAttribute("searchtxt", "");
			}
		}
		
		int totalCount = o2service.dealCount(search, searchtxt);
		int pageSize=10;
		int blockSize=5;
		
		O2Page page = new O2Page(currPage, totalCount, pageSize, blockSize);
		List<O2MainBoardDTO> list= o2service.dealList(search, searchtxt, page.getStartRow(), pageSize);
		
		model.addAttribute("list",list);
		model.addAttribute("page",page);
		model.addAttribute("search",search);
		model.addAttribute("searchtxt",searchtxt);
		 
		return "writeboard/deallist";
	}
	
	@RequestMapping("/tdealdetail/{no}")
	public String tdealdetail(Model model,@PathVariable int no,HttpSession session) {

		O2WriteBoardDTO list= service.twritedetail(no);
		List<O2FileDTO> list2=service.tfiledetail(no);
		String price=service.getprice(no);
		String id=(String)session.getAttribute("user_id");
		
		
		model.addAttribute("id",id);
		model.addAttribute("price",price);
		model.addAttribute("list",list);
		model.addAttribute("list2",list2);

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
//		System.out.println(dto.getCategory());
//		System.out.println(dto.getContent());
//		System.out.println(dto.getTitle());
//		System.out.println(dto.getTradeno());
//		System.out.println(dto.getSell_price());
		
		service.twritemodifyresult(dto,images);
		
		String root_path = request.getSession().getServletContext().getRealPath("/"); 
		String attach_path = "resources/img/";
		 for (MultipartFile mf : images) {
	            String fileName = mf.getOriginalFilename(); // 원본 파일 명

//	            System.out.println("originFileName : " + fileName);

	            String safeFile = root_path + attach_path + fileName;
//	            System.out.println(safeFile);
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
	
	@PostMapping("/deal")
	@ResponseBody
	public String deal(@RequestBody O2DealDTO dto) {
		int before=Integer.parseInt(service.getprice(dto.getTradeno()));
		int after=Integer.parseInt(dto.getDeal_price());
			if(after>before) {
				service.dealinsert(dto);
		}
		String result=service.getprice(dto.getTradeno());
		return result;
	}
	@RequestMapping("treplyresult")
	public String treplyresult(O2ReplyDTO dto) {
		service.treplyinsert(dto);
		
		return "redirect:/twritedetail/"+dto.getTradeno();
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
	
	
	
	
	
}

