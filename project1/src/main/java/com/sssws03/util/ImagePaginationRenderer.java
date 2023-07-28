package com.sssws03.util;

	import egovframework.rte.ptl.mvc.tags.ui.pagination.AbstractPaginationRenderer;
	 
	public class ImagePaginationRenderer extends AbstractPaginationRenderer {
	 
		public ImagePaginationRenderer() {
			firstPageLabel = "<a href=\"#\" onclick=\"{0}({1}); return false;\"><image src=\"./img/cleft_arrows.png\" border=0/></a>&#160;"; 
			previousPageLabel = "<a href=\"#\" onclick=\"{0}({1}); return false;\"><image src=\"./img/left_arrows.png\" border=0/></a>&#160;";
			currentPageLabel = "<strong>{0}</strong>&#160;";
			otherPageLabel = "<a href=\"#\" onclick=\"{0}({1}); return false;\">{2}</a>&#160;";
			nextPageLabel = "<a href=\"#\" onclick=\"{0}({1}); return false;\"><image src=\"./img/right_arrows.png\" border=0/></a>&#160;";
			lastPageLabel = "<a href=\"#\" onclick=\"{0}({1}); return false;\"><image src=\"./img/cright_arrows.png\" border=0/></a>&#160;";
		}
	}

