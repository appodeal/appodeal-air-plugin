package com.appodeal.aneplugins.callbacks;

import com.appodeal.ads.BannerCallbacks;
import com.appodeal.aneplugins.AppodealContext;

public class AppodealBannerListener implements BannerCallbacks {

    protected AppodealContext _ctx = null;

    public AppodealBannerListener(AppodealContext ctx) {
        _ctx = ctx;
    }

    @Override
    public void onBannerClicked() {
        _ctx.dispatchStatusEventAsync("BANNER_CLICKED", "");
    }

    @Override
    public void onBannerFailedToLoad() {
        _ctx.dispatchStatusEventAsync("BANNER_FAILED_TO_LOAD", "");
    }

    @Override
    public void onBannerLoaded(int height, boolean isPrecache) {
        _ctx.dispatchStatusEventAsync("BANNER_LOADED", "");
    }

    @Override
    public void onBannerShown() {
        _ctx.dispatchStatusEventAsync("BANNER_SHOWN", "");
    }

}
