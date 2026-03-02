#include <stdlib.h>
#include <sys/types.h>
#include <pwd.h>
#include <string.h>

/* Strip LD_PRELOAD so child processes spawned by claude are not affected. */
__attribute__((constructor))
static void init(void) { unsetenv("LD_PRELOAD"); }

uid_t getuid(void)  { return 1000; }
uid_t geteuid(void) { return 1000; }

struct passwd *getpwuid(uid_t uid) {
    static struct passwd pw;
    if (uid != 1000) return NULL;
    pw.pw_name   = "root";
    pw.pw_passwd = "x";
    pw.pw_uid    = 1000;
    pw.pw_gid    = 0;
    pw.pw_gecos  = "root";
    pw.pw_dir    = "/root";
    pw.pw_shell  = "/bin/bash";
    return &pw;
}
