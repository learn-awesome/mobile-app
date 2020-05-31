package org.learnawesome.app;
import android.content.Intent;
import android.os.Bundle;
import androidx.annotation.NonNull;
import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;

public class MainActivity extends FlutterActivity {
    private String sharedData = null;
    private static final String CHANNEL = "org.learnawesome.app/shared.data";

    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        super.configureFlutterEngine(flutterEngine);
        new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), CHANNEL)
                .setMethodCallHandler(
                        (call, result) -> {
                            if (call.method.equals("getSharedData")) {
                                result.success(sharedData);
                            } else {
                                result.notImplemented();
                            }
                        }
                );
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        GeneratedPluginRegistrant.registerWith(new FlutterEngine(this));

        // Handle intent when app is initially opened
        handleSendIntent(getIntent());

    }

    @Override
    protected void onNewIntent(Intent intent) {
        // Handle intent when app is resumed
        super.onNewIntent(intent);
        handleSendIntent(intent);
    }

    private void handleSendIntent(Intent intent) {
        String action = intent.getAction();
        String type = intent.getType();

        // We only care about sharing intent that contain plain text
        if (Intent.ACTION_SEND.equals(action) && type != null) {
            if ("text/plain".equals(type)) {
                sharedData = intent.getStringExtra(Intent.EXTRA_TEXT);
            }
        }

        if (Intent.ACTION_VIEW.equals(action)) {
            sharedData = intent.getData().toString();
        }
    }
}
