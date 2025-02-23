# macOS設定

macOSの設定をコマンドで変更する。変更後はrestartしないと反映されない設定がある。

```shell
# Finderのファイルを開くときのすべてのアニメーションを無効化
defaults write com.apple.finder DisableAllAnimations -boolean true; killall Finder
# 元に戻す場合 → defaults delete com.apple.finder DisableAllAnimations; killall Finder

# スクロールが弾むアニメーションを無効化
defaults write -g NSScrollViewRubberbanding -bool no; killall Finder
#元に戻す場合 → defaults delete -g NSScrollViewRubberbanding; killall Finder

# スクリーンショットから影を取り除く
defaults write com.apple.screencapture disable-shadow -boolean true;killall SystemUIServer

# オートマチックウィンドウアニメーションを全て無効化
defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool NO
# 元に戻す場合 → defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool YES

# Launchpadのアニメーションを全て無効化
defaults write com.apple.dock springboard-show-duration -float 0
defaults write com.apple.dock springboard-hide-duration -float 0
defaults write com.apple.dock springboard-page-duration -float 0
# 元に戻す場合↓
# defaults delete com.apple.dock springboard-show-duration; killall Dock
# defaults delete com.apple.dock springboard-hide-duration ; killall Dock
# defaults delete com.apple.dock springboard-page-duration ; killall Dock

# スムーズスクローリング全て無効
defaults write -g NSScrollAnimationEnabled -bool false;

#クイックルック表示時のアニメーション全て無効
defaults write -g QLPanelAnimationDuration -float 0

# リサイジングアニメーション全て無効
defaults write -g NSDocumentRevisionsWindowTransformAnimation -bool false

#カラムアニメーション全て無効
defaults write -g NSBrowserColumnAnimationSpeedMultiplier -float 0

# ダイアログの表示速度高速化
defaults write -g NSWindowResizeTime 0.001
# 元に戻す場合 → defaults delete -g NSWindowResizeTime

# アイコンをドラッグした時のアニメーション高速化
defaults write com.apple.finder AnimateSnapToGrid -boolean false; killall Finder
# 元に戻す場合 → defaults write com.apple.finder AnimateSnapToGrid -boolean true; killall Finder

# クイックルックで表示したテキストをコピペ有効化
defaults write com.apple.finder QLEnableTextSelection -bool true; killall Finder
# 元に戻す場合 → defaults delete com.apple.finder QLEnableTextSelection; killall Finder

# 他アプリに切り替えたらクイックルックを非表示
defaults write com.apple.finder QLHidePanelOnDeactivate -bool true;killall Finder
# 元に戻す場合 defaults delete com.apple.finder QLHidePanelOnDeactivate;killall Finder

# ダッシュボードを無効にしてメモリ節約と高速化。
defaults write com.apple.dashboard mcx-disabled -boolean true; killall Dock
# 元に戻す場合 → defaults delete com.apple.dashboard mcx-disabled; killall Dock

# Dockアニメーション高速化
defaults write com.apple.dock autohide-time-modifier -float 0;killall Dock
defaults write com.apple.dock autohide-delay -float 0;killall Dock
# 元に戻す場合 → defaults delete com.apple.dock autohide-time-modifier;killall Dock

# Dockが表示される時間を0に設定
defaults write com.apple.dock autohide-delay -float 0;killall Dock

# Dockに格納するエフェクトをSuckに変更
defaults write com.apple.dock mineffect suck; killall Dock

# ミッションコントロールのアニメーション時間を変更
defaults write com.apple.dock expose-animation-duration -float 0.1;killall Dock

# アプリがデスクトップ間を移動する際の速度を変更
defaults write com.apple.dock workspaces-edge-delay -float 0.1;killall Dock

# ファインダーのアニメーションを削除
defaults write com.apple.finder AnimateInfoPanes -boolean false;killall Finder
# 元に戻すdefaults delete com.apple.finder AnimateInfoPanes;killall Finder

# ネットワークドライブで.DS_Storeファイルを作成しないよう設定
defaults write com.apple.desktopservices DSDontWriteNetworkStores true

# キーリピート速度変更
defaults write -g InitialKeyRepeat -int 12
# normal minimum is 15 (225 ms)
defaults write -g KeyRepeat -int 1
# normal minimum is 2 (30 ms)
```

```shell
# スペル修正を無効化
defaults write -g NSAutomaticSpellingCorrectionEnabled -bool false

# マウスの速度を最速化
defaults write -g com.apple.mouse.scaling 5

# dockを非表示。カーソルを合わせると表示。
defaults write com.apple.dock autohide -bool true


```

## `defaults`コマンド

macOSにどんなアプリが入っているか調べるコマンド

```shell
defaults domains
```