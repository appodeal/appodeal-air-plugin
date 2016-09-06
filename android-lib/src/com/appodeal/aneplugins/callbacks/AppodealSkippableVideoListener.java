package com.appodeal.aneplugins.callbacks;

import com.appodeal.ads.SkippableVideoCallbacks;
import com.appodeal.aneplugins.AppodealContext;

public class AppodealSkippableVideoListener implements SkippableVideoCallbacks {

    protected AppodealContext _ctx = null;

    public AppodealSkippableVideoListener(AppodealContext ctx) {
        _ctx = ctx;
    }

    @Override
    public void onSkippableVideoShown() {
        _ctx.dispatchStatusEventAsync("SKIPPABLE_VIDEO_SHOWN", "");
    }

    @Override
    public void onSkippableVideoLoaded() {
        _ctx.dispatchStatusEventAsync("SKIPPABLE_VIDEO_LOADED", "");
    }

    @Override
    public void onSkippableVideoFinished() {
        _ctx.dispatchStatusEventAsync("SKIPPABLE_VIDEO_FINISHED", "");
    }

    @Override
    public void onSkippableVideoFailedToLoad() {
        _ctx.dispatchStatusEventAsync("SKIPPABLE_VIDEO_FAILED_TO_LOAD", "");
    }

    @Override
    public void onSkippableVideoClosed(boolean finished) {
        _ctx.dispatchStatusEventAsync("SKIPPABLE_VIDEO_CLOSED", "");
    }

}
