/* See LICENSE file for copyright and license details. */

/* Notification */
static char *notifycmd = "libnotify"; /* Use built-in libnotify if empty */
static char *notifyext = ""; /* Notify with extra command (eg. play an alarm) */

/*
 * This is the array which defines all the timer that will be used.
 * It will be repeated after all of it is executed.
 */
static Timer timer[] = {
	/* timer            comment */
	{  1500,            "Time to start working!"},
	{   300,            "Time to start resting!"},
	{  1500,            "Time to start working!"},
	{   300,            "Time to start resting!"},
	{  1500,            "Time to start working!"},
	{   300,            "Time to start resting!"},
	{  1500,            "Time to start working!"},
	{   300,            "Time to start resting!"},
	{   900,            "Time to take some nap!"},
};