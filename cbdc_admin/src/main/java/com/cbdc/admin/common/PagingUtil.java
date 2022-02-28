package com.cbdc.admin.common;

public class PagingUtil {

	private Integer pagesPerBlock;
    private Integer postsPerPage;
    private Long totalPostCount;

    private Integer totalLastPageNum;

    public PagingUtil(Integer pagesPerBlock, Integer postsPerPage, Long totalPostCount) {
        this.pagesPerBlock = pagesPerBlock;
        this.postsPerPage = postsPerPage;
        this.totalPostCount = totalPostCount;

        this.setTotalLastPageNum();
    }

    public Integer getPagesPerBlock() {
        return pagesPerBlock;
    }

    public Integer getPostsPerPage() {
        return postsPerPage;
    }

    public Long getTotalPostCount() {
        return totalPostCount;
    }

    public Integer getTotalLastPageNum() {
        return this.totalLastPageNum;
    }

    public void setPagesPerBlock(Integer pagesPerBlock) {
        this.pagesPerBlock = pagesPerBlock;
    }

    public void setPostsPerPage(Integer postsPerPage) {
        this.postsPerPage = postsPerPage;
        this.setTotalLastPageNum();
    }

    public void setTotalPostCount(Long totalPostCount) {
        this.totalPostCount = totalPostCount;
        this.setTotalLastPageNum();
    }

    private void setTotalLastPageNum() {
        // 총 게시글 수를 기준으로 한 마지막 페이지 번호 계산
        // totalPostCount 가 0인 경우 1페이지로 끝냄
        if(totalPostCount == 0) {
            this.totalLastPageNum = 1;
        } else {
            this.totalLastPageNum = (int) (Math.ceil((double)totalPostCount / postsPerPage));
        }
    }

    @SuppressWarnings("unused")
	private String getBlock(Integer currentPageNum, Boolean isFixed) {

        if(pagesPerBlock % 2 == 0 && !isFixed) {
            throw new IllegalStateException("getElasticBlock: pagesPerBlock은 홀수만 가능합니다.");
        }

        if(currentPageNum > totalLastPageNum && totalPostCount != 0) {
            throw new IllegalStateException("currentPage가 총 페이지 개수(" + totalLastPageNum + ") 보다 큽니다.");
        }

        // 블럭의 첫번째, 마지막 페이지 번호 계산
        Integer blockLastPageNum = totalLastPageNum;
        Integer blockFirstPageNum = 1;

        // 글이 없는 경우, 1페이지 반환.
        if(isFixed) {
            Integer mod = totalLastPageNum % pagesPerBlock;
            if(totalLastPageNum - mod >= currentPageNum) {
                blockLastPageNum = (int) (Math.ceil((float)currentPageNum / pagesPerBlock) * pagesPerBlock);
                blockFirstPageNum = blockLastPageNum - (pagesPerBlock - 1);
            } else {
                blockFirstPageNum = (int) (Math.ceil((float)currentPageNum / pagesPerBlock) * pagesPerBlock) - (pagesPerBlock - 1);
            }
            
        } else {
            // 블록의 한가운데 계산 (예: 5->2, 9->4)
            Integer mid = pagesPerBlock / 2;

            // 블럭의 첫번째, 마지막 페이지 번호 계산
            if(currentPageNum <= pagesPerBlock) {
                blockLastPageNum = pagesPerBlock;
            } else if(currentPageNum < totalLastPageNum - mid) {
                blockLastPageNum = currentPageNum + mid;
            }

            blockFirstPageNum = blockLastPageNum - (pagesPerBlock - 1);

            if(totalLastPageNum < pagesPerBlock) {
                blockLastPageNum = totalLastPageNum;
                blockFirstPageNum = 1;
            }
        }
        String fnNm ="fnGoPaging";
        if(pagesPerBlock == 5) {
        	fnNm ="fnGoPaging2";
        }
        
        StringBuffer pagingView = new StringBuffer();
        // 이전페이지 이동 체크
        if((int)currentPageNum > (int)pagesPerBlock) {
        	pagingView.append("<a href=\"javascript:"+fnNm+"(1);\" class=\"fst\">&nbsp;<span class=\"hideTxt\">처음</span></a>");
        	pagingView.append("<a href=\"javascript:"+fnNm+"(" + (blockFirstPageNum -1) + ");\" class=\"prv\">&nbsp;<span class=\"hideTxt\">이전</span></a>");
        }
        
        // 페이지 번호 할당
        for(int i = 0, val = blockFirstPageNum; val <= blockLastPageNum; i++, val++) {
        	// 현재페이지
        	if(currentPageNum == val) {
        		pagingView.append("<a href=\"javascript:"+fnNm+"(" + val + ");\" class=\"current\">" + val + "</a>");
        	} else {
        		pagingView.append("<a href=\"javascript:"+fnNm+"(" + val + ");\">" + val + "</a>");
        	}
        }
        
        // 다음페이지 이동 체크
        if((blockLastPageNum != 1 ? (int)blockLastPageNum != (int)totalLastPageNum : false)) {
        	pagingView.append("<a href=\"javascript:"+fnNm+"(" + (blockLastPageNum +1) + ");\" class=\"nxt\">&nbsp;<span class=\"hideTxt\">다음</span></a>");
        	pagingView.append("<a href=\"javascript:"+fnNm+"(" + totalLastPageNum + ");\" class=\"end\">&nbsp;<span class=\"hideTxt\">맨끝</span></a>");
        }
        
        return pagingView.toString();
    }

    public String getElasticBlock(Integer currentPageNum) {
        return this.getBlock(currentPageNum, false);
    }

    public String getFixedBlock(Integer currentPageNum) {
        return this.getBlock(currentPageNum, true);
    }

}
