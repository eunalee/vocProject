package com.bitcamp.voc;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bitcamp.voc.product.model.CartVO;
import com.bitcamp.voc.product.model.ProductList;
import com.bitcamp.voc.product.model.ProductListView;
import com.bitcamp.voc.product.model.ProductVO;
import com.bitcamp.voc.product.service.DeleteProductService;
import com.bitcamp.voc.product.service.EditProductService;
import com.bitcamp.voc.product.service.GetProductListService;
import com.bitcamp.voc.product.service.RegisterProductService;

@Controller
public class ProductController {
	@Autowired
	RegisterProductService registerProductService;  //상품 등록 서비스
	
	@Autowired
	GetProductListService getProductListService;   //상품 목록 출력 서비스

	@Autowired
	EditProductService editProductService;  //상품 수정 서비스
	
	@Autowired
	DeleteProductService deleteProductService;  //상품 삭제 서비스

	//상품 검색 페이지
	@RequestMapping("/product/search")
	public String searchForm() {
		return "/product/productSearch";
	}
	
	//상품 검색
	@RequestMapping("/product/productList.json")
	@ResponseBody
	public List<ProductVO> search(@RequestParam("category") String category, @RequestParam("regDateFrom") String regDateFrom, @RequestParam("regDateTo") String regDateTo) {
		return getProductListService.getProductListBySearch(category, regDateFrom, regDateTo);
	}
	
	//전체 상품보기
	@RequestMapping("/product/viewAll")
	public String getList(HttpServletRequest request, Model model) {
		String pageNumStr = request.getParameter("page");
		
		int pageNum = 1;
		
		if(pageNumStr != null)
			pageNum = Integer.parseInt(pageNumStr);
		
		ProductListView viewData = getProductListService.getProductList(pageNum);
		
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("viewData", viewData);
		model.addAttribute("productList", viewData.getProductList());
		model.addAttribute("totalPageCount", viewData.getPageTotalCount());
		
		return "/product/productList";
	}
	
	//전체 상품보기 - 페이징
	@RequestMapping("/product/viewAll/{page}")
	public String getList(@PathVariable int page, HttpServletRequest request, Model model) {
		if(page == 0)
			page = 1;
		
		ProductListView viewData = getProductListService.getProductList(page);
		
		model.addAttribute("pageNum", page);
		model.addAttribute("viewData", viewData);
		model.addAttribute("productList", viewData.getProductList());
		model.addAttribute("totalPageCount", viewData.getPageTotalCount());
		
		return "/product/productList";
	}
	
	//카테고리별 상품 보기 페이지
	@RequestMapping("/product/viewCategory")
	public String getListByCategoryForm() {
		return "/product/productListByCategoryForm";
	}
	
	//카테고리별 상품 목록 보기
	@RequestMapping("/product/viewCategory/{category}")
	public String getListByCategory(@PathVariable("category") String category, HttpServletRequest request, Model model) {
		String pageNumStr = request.getParameter("page");
		
		int pageNum = 1;
		
		if(pageNumStr != null)
			pageNum = Integer.parseInt(pageNumStr);
		
		ProductListView viewData = getProductListService.getProductListByCateogory(pageNum, category);
		
		model.addAttribute("category", category);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("viewData", viewData);
		model.addAttribute("productList", viewData.getProductList());
		model.addAttribute("totalPageCount", viewData.getPageTotalCount());
		
		return "/product/productListByCategory";
	}
	
	//카테고리별 상품 목록 보기 - 페이징
	@RequestMapping("/product/viewCategory/{category}/{page}")
	public String getListByCategory(@PathVariable("category") String category, @PathVariable("page") int page, HttpServletRequest request, Model model) {
		if(page == 0)
			page = 1;
		
		ProductListView viewData = getProductListService.getProductListByCateogory(page, category);
		
		model.addAttribute("category", category);
		model.addAttribute("pageNum", page);
		model.addAttribute("viewData", viewData);
		model.addAttribute("productList", viewData.getProductList());
		model.addAttribute("totalPageCount", viewData.getPageTotalCount());
		
		return "/product/productListByCategory";
	}
	
	//상품 상세보기 페이지
	@RequestMapping("/product/viewProduct/{id}")
	public String descForm(@PathVariable("id") int id, Model model) {
		model.addAttribute("product", getProductListService.getProductListById(id));
		
		return "/product/productViewForm";
	}
	
	//상품 카트 담기 - 1개
	@RequestMapping(value="/product/addtocart", method=RequestMethod.POST)
	public String productAddToCart(HttpServletRequest request, Model model) {
		CartVO cart = new CartVO();
		
		cart.setProductKey(Integer.parseInt(request.getParameter("productKey")));
		cart.setProductName(request.getParameter("productName"));
		cart.setProductPrice(Integer.parseInt(request.getParameter("productPrice")));
		cart.setProductQuantity(Integer.parseInt(request.getParameter("productQuantity")));
		cart.setProductOption(request.getParameter("productOption"));
		cart.setProductImg(request.getParameter("productImg"));
		
		model.addAttribute("cart", cart);
		
		return "/order/productCart";
	}
	
	//상품 카트 담기 - 여러 개
	@RequestMapping(value="/products/addtocart", method=RequestMethod.POST)
	public String productsAddToCart(HttpServletRequest request, Model model) {
		String referer = request.getHeader("referer");
		
/*		CartVO cart = new CartVO();
		List<CartVO> cartList = new ArrayList<CartVO>();
		
		cart.setProductKey(Integer.parseInt(request.getParameter("productKey")));
		cart.setProductName(request.getParameter("productName"));
		cart.setProductPrice(Integer.parseInt(request.getParameter("productPrice")));
		cart.setProductQuantity(Integer.parseInt(request.getParameter("productQuantity")));
		cart.setProductOption(request.getParameter("productOption"));
		cart.setProductImg(request.getParameter("productImg"));
		
		cartList.add(cart);*/
		
		return "redirect:" + referer;
	}
	
	//상품 등록 페이지
	@RequestMapping(value="/product/register", method=RequestMethod.GET)
	public String registerForm() {
		return "/product/productRegisterForm";
	}
	
	//상품 등록
	@RequestMapping(value="/product/register", method=RequestMethod.POST)
	public String register(HttpServletRequest request, ProductVO product, Model model) throws Exception {
		model.addAttribute("resultCnt", registerProductService.register(request, product));
		
		return "/product/productCheck";
	}
	
	//상품 수정 페이지
	@RequestMapping("/product/edit/{productId}")
	public String editForm(@PathVariable("productId") int id,Model model) {
		model.addAttribute("productId", id);
		model.addAttribute("product", getProductListService.getProductListById(id));
		
		return "/product/productEditForm";
	}
	
	//상품 수정
	@RequestMapping("/product/edit")
	public String edit(HttpServletRequest request, ProductVO product, Model model) throws Exception {
		model.addAttribute("resultCnt", editProductService.edit(request, product));
		
		return "/product/productCheck";
	}
	
	//상품 삭제
	@RequestMapping("/product/delete/{productId}")
	public String delete(@PathVariable("productId") int id, Model model) {
		model.addAttribute("resultCnt", deleteProductService.delete(id));
		
		return "/product/productCheck";
	}
	
	//예외 발생 시
	@ExceptionHandler(Exception.class)
	public String exception(Exception e, Model model) {
		model.addAttribute("error", e.getMessage());
		
		return "/product/exception";
	}
}