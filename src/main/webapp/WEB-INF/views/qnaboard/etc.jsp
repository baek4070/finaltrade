<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
<sec:authorize access="isAuthenticated()">
	<c:if test="${pinfo.user.u_id ne board.writerId}">
		<c:choose>
			<c:when test="${empty wishlist}">
				<button class="btn btn-danger addheart"
				style="position:absolute; border-radius: 0.25rem; float: right; margin:153px 8px 8px 246px;"
				data-w_uno="${pinfo.user.uno}"
				data-uno="${board.uno}"
				data-bno="${board.bno}">
					<img width="25px"src="../resources/img/heart2.png"/>
				</button>
			</c:when>
			<c:otherwise>
				<button class="btn btn-danger removeheart"
				style="position:absolute; border-radius: 0.25rem; float: right; margin:153px 8px 8px 246px;"
				data-w_uno="${pinfo.user.uno}"
				data-uno="${board.uno}"
				data-bno="${board.bno}">
					<img width="25px" src="../resources/img/heart1.png"/>
				</button>
			</c:otherwise>
		</c:choose>
	</c:if>
</sec:authorize>
								
									
		$(".addheart").on("click",function(){
			let w_uno = $(this).data("w_uno");
			let bno = $(this).data("bno");
			let uno = $(this).data("uno");
			var test2 = "<form id='addheart' method='post' action='/board/list/addWishlist'>";
				test2 += "<input type='hidden' name='${_csrf.parameterName}' value='${_csrf.token}'/>";
				test2 += "<input type='hidden' name='w_uno' value='"+w_uno+"'/>";
				test2 += "<input type='hidden' name='bno' value='"+bno+"'/>";
				test2 += "<input type='hidden' name='uno' value='"+uno+"'/>";
				test2 += "</form>";
				$("#test").append(test2);
			$("#addheart").submit();
		});
		$(".removeheart").on("click",function(){
			let w_uno = $(this).data("w_uno");
			let bno = $(this).data("bno");
			let uno = $(this).data("uno");
			var test2 = "<form id='removeheart' method='post' action='/board/removeWishlist'>";
				test2 += "<input type='hidden' name='${_csrf.parameterName}' value='${_csrf.token}'/>";
				test2 += "<input type='hidden' name='w_uno' value='"+w_uno+"'/>";
				test2 += "<input type='hidden' name='bno' value='"+bno+"'/>";
				test2 += "<input type='hidden' name='uno' value='"+uno+"'/>";
				test2 += "</form>";
				$("#test").append(test2);
			$("#removeheart").submit();
		});
			
			
			@GetMapping("/anonymous/detail")
	public String detail(@RequestParam("bno") int bno, BoardCommentVO board,@ModelAttribute("cri") Criteria cri,
			Model model) throws Exception {
		model.addAttribute("board",service.get(bno));
		service.updateViewCnt(bno);
		
		// 댓글 리스트
		List<BoardCommentVO> commentList = service.getCommentList(bno);
		model.addAttribute("commentList", commentList);
		
		// 찜 리스트
		return "redirect:/board/detail?bno="+bno;
	}