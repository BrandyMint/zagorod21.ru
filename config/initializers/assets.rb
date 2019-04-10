
Rails.application.config.assets.version = AppVersion.to_s
NonStupidDigestAssets.whitelist += [ /*\.png/, /\.svg/, /\.woff.?/, /\.ttf/]
