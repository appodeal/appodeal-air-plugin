package com.appodeal.aneplugins.callbacks;

import com.appodeal.ads.RewardedVideoCallbacks;
import com.appodeal.aneplugins.AppodealContext;

public class AppodealRewardedVideoListener implements RewardedVideoCallbacks {



    protected AppodealContext _ctx = null;

    public AppodealRewardedVideoListener(AppodealContext ctx) {
        _ctx = ctx;
    }

    @Override
    public void onRewardedVideoShown() {
        _ctx.dispatchStatusEventAsync("REWARDED_VIDEO_SHOWN", "");
    }

    @Override
    public void onRewardedVideoLoaded() {
        _ctx.dispatchStatusEventAsync("REWARDED_VIDEO_LOADED", "");
    }

    @Override
    public void onRewardedVideoFailedToLoad() {
        _ctx.dispatchStatusEventAsync("REWARDED_VIDEO_FAILED_TO_LOAD", "");
    }

    @Override
    public void onRewardedVideoClosed(boolean finished) {
        _ctx.dispatchStatusEventAsync("REWARDED_VIDEO_CLOSED", "");
    }

    @Override
    public void onRewardedVideoFinished(int amount, String name) {
        String level = "<info amount='" + amount + "' name='" + name + "' ></info>";
        _ctx.dispatchStatusEventAsync("REWARDED_VIDEO_FINISHED", level);
    }

}
