/* See LICENSE file for copyright and license details. */

/* Notification, remove DNOTIFY in config.mk if you don't want it */
static char *notifycmd = ""; /* Uses given command if not compiled by DNOTIFY */
static char *notifyext = ""; /* Notify with extra command (eg. play an alarm) */

/* define icons */
#define PLAYICON		"~/.local/icons/play.png"
#define PAUSEICON		"~/.local/icons/pause.png"
#define TIMERPAUSEICON	"~/.local/icons/timer_pause.png"
#define TIMERRESUMEICON	"~/.local/icons/timer_resume.png"
#define WORKICON		"~/.local/icons/work.png"
#define BREAKICON		"~/.local/icons/time.png"
#define LONGBREAKICON	"~/.local/icons/bed.png"

/* define sounds */
#define NOTIFYSOUNDCMD	"mpv /usr/share/sounds/freedesktop/stereo/message.oga > /dev/null 2>&1"
#define TIMERSOUNDCMD	"mpv /usr/share/sounds/freedesktop/stereo/complete.oga > /dev/null 2>&1"

/*
 * This is the array which defines all the timer that will be used.
 * It will be repeated after all of it is executed.
 */
static Timers timers[] = {
	/*    timer(s)   comment					ICON         */
	{     1500,		"Time to start working!",	WORKICON},
	{      300,		"Time to start resting!",	BREAKICON},
	{     1500,		"Time to start working!",	WORKICON},
	{      300,		"Time to start resting!",	BREAKICON},
	{     1500,		"Time to start working!",	WORKICON},
	{      300,		"Time to start resting!",	BREAKICON},
	{     1500,		"Time to start working!",	WORKICON},
	{      300,		"Time to start resting!",	BREAKICON},
	{      900,		"Time to take some nap!",	LONGBREAKICON},
};
