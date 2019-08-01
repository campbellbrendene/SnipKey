#SingleInstance Ignore	; Force in dev, change to Ignore in prod

Menu, Tray, Tip, SnipKey - github.com/campbellbrendene
Menu, Tray, Icon, C:\Windows\System32\SnippingTool.exe
Menu, Tray, NoMainWindow
Menu, Tray, Click, 1
Menu, Tray, NoStandard
Menu, Tray, Add, &Rectangle Snip, RectangleSnip
Menu, Tray, Default, &Rectangle Snip
Menu, Tray, Add, &Fullscreen Snip, FullscreenSnip
Menu, Tray, Add, &Window Snip, WindowSnip
Menu, Tray, Add
Menu, Tray, Add, SnipKey v1.0.0 by Brenden Campbell, Void
Menu, Tray, Disable, SnipKey v1.0.0 by Brenden Campbell
Menu, Tray, Add, &GitHub, ViewGitHub
Menu, Tray, Add
Menu, Tray, Add, Exit, Exit

Void()
{
	Return
}

ViewGitHub()
{
	Run, https://github.com/campbellbrendene
}

Exit()
{
	ExitApp
	Return
}

_OpenTool(keys)
{
	Run, C:\Windows\System32\SnippingTool.exe
	WinWaitActive, Snipping Tool
	WinGetPos,,, Width, Height
	WinMove, ,, (A_ScreenWidth/2)-(Width/2), (A_ScreenHeight/2)-(Height/2)
	WinSetTitle, SnipKey - github.com/campbellbrendene
	WinSet, Transparent, 192
	Send, %keys%
	Return
}

RectangleSnip()
{
	_OpenTool("!mr")
	Return
}

FullscreenSnip()
{
	_OpenTool("!ms")
	Return
}

WindowSnip()
{
	_OpenTool("!mw")
	Return
}

#\::	; Area
	RectangleSnip()
	Return

+#\::	; Full-screen
	FullscreenSnip()
	Return

^#\::	; Window
	WindowSnip()
	Return