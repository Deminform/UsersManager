package com.usermanager.model;


public class Pages {
    private int page;
    private int sizePage;
    private int maxSizePage;

    public Pages() {
        this.sizePage = 5;
        this.page = 0;
    }

    public int getMaxSizePage() {
        return maxSizePage;
    }

    public void setMaxSizePage(int maxSizePage) {
        this.maxSizePage = maxSizePage;
    }

    public int getSizePage() {
        return sizePage;
    }

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

}
