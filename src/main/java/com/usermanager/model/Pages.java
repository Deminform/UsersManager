package com.usermanager.model;


public class Pages {
    private final int sizePage = 10;
    private int page = 0;

    public Pages() {
        this.page = 0;
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

    public void nextPage() {
        page = page + sizePage;
    }

    public void prevPage() {
        if (!(page <= 0)) {
            page = page - sizePage;
        }
    }
}
