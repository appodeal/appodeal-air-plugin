package com.appodeal.aneplugins;

import com.appodeal.ads.VideoCallbacks;

public class AppodealVideoListener implements VideoCallbacks {

	protected AppodealContext _ctx = null;

	public AppodealVideoListener(AppodealContext ctx) {
		_ctx = ctx;
	}

	@Override
	public void onVideoShown() {
		_ctx.dispatchStatusEventAsync("VIDEO_SHOWN", "");
	}

	@Override
	public void onVideoLoaded() {
		_ctx.dispatchStatusEventAsync("VIDEO_LOADED", "");
	}

	@Override
	public void onVideoFinished() {
		_ctx.dispatchStatusEventAsync("VIDEO_FINISHED", "");
	}

	@Override
	public void onVideoFailedToLoad() {
		_ctx.dispatchStatusEventAsync("VIDEO_FAILED_TO_LOAD", "");
	}

	@Override
	public void onVideoClosed() {
		_ctx.dispatchStatusEventAsync("VIDEO_CLOSED", "");
	}

}
