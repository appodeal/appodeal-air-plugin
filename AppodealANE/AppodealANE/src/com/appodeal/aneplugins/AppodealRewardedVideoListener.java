package com.appodeal.aneplugins;

import com.appodeal.ads.RewardedVideoCallbacks;

public class AppodealRewardedVideoListener implements RewardedVideoCallbacks {

	protected AppodealContext _ctx = null;

	public AppodealRewardedVideoListener(AppodealContext ctx) {
		_ctx = ctx;
	}

	@Override
	public void onVideoShown() {
		_ctx.dispatchStatusEventAsync("REWARDED_VIDEO_SHOWN", "");
	}

	@Override
	public void onVideoLoaded() {
		_ctx.dispatchStatusEventAsync("REWARDED_VIDEO_LOADED", "");
	}

	@Override
	public void onVideoFailedToLoad() {
		_ctx.dispatchStatusEventAsync("REWARDED_VIDEO_FAILED_TO_LOAD", "");
	}

	@Override
	public void onVideoClosed() {
		_ctx.dispatchStatusEventAsync("REWARDED_VIDEO_CLOSED", "");
	}

	@Override
	public void onVideoFinished(int amount, String name) {
		_ctx.dispatchStatusEventAsync("REWARDED_VIDEO_FINISHED", String.valueOf(amount));
	}

}
