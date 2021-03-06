/*
 *  Build script for iMatix SFL Package, for OS/2.
 *  Requires the iMatix 'c.cmd' script.
 *
 *  Generated by Otto v2.2 from buildsfl.txt on 100/04/01, 16:20:25
 *  For more info see Otto documentation at http://www.imatix.com.
 *  Bug reports & questions to <ewen@imatix.com>
 *  ---------------------------------------------------------------
 */
'@echo off'

/* Configuration options ------------------------------------------ 
 *
 * The actual programs use to compile, compile and archive, and 
 * link programs can be changed by editing the subroutines
 * CompileToObj, CompileToLib, and LinkProgram, at the bottom of
 * this script.  REXX doesn't support variable substitution in
 * the name of the called routine, so they cannot be defined here.
 */

SAY "Building sfl.h header file..."

/* delete sfl.h */
'if exist sfl.h del sfl.h >nul'

/* append sflhead.h  sfl.h */
'type sflhead.h >> sfl.h'

/* append prelude.h  sfl.h */
'type prelude.h >> sfl.h'

/* append sflvers.h  sfl.h */
'type sflvers.h >> sfl.h'

/* append sflbits.h  sfl.h */
'type sflbits.h >> sfl.h'

/* append sflcomp.h  sfl.h */
'type sflcomp.h >> sfl.h'

/* append sflcons.h  sfl.h */
'type sflcons.h >> sfl.h'

/* append sflconv.h  sfl.h */
'type sflconv.h >> sfl.h'

/* append sflcryp.h  sfl.h */
'type sflcryp.h >> sfl.h'

/* append sfldate.h  sfl.h */
'type sfldate.h >> sfl.h'

/* append sflexdr.h  sfl.h */
'type sflexdr.h >> sfl.h'

/* append sflfind.h  sfl.h */
'type sflfind.h >> sfl.h'

/* append sflfile.h  sfl.h */
'type sflfile.h >> sfl.h'

/* append sfllang.h  sfl.h */
'type sfllang.h >> sfl.h'

/* append sfllbuf.h  sfl.h */
'type sfllbuf.h >> sfl.h'

/* append sfllist.h  sfl.h */
'type sfllist.h >> sfl.h'

/* append sflmath.h  sfl.h */
'type sflmath.h >> sfl.h'

/* append sflmesg.h  sfl.h */
'type sflmesg.h >> sfl.h'

/* append sflmem.h   sfl.h */
'type sflmem.h >> sfl.h'

/* append sflmime.h  sfl.h */
'type sflmime.h >> sfl.h'

/* append sflnode.h  sfl.h */
'type sflnode.h >> sfl.h'

/* append sfldir.h   sfl.h */
'type sfldir.h >> sfl.h'

/* append sflslot.h  sfl.h */
'type sflslot.h >> sfl.h'

/* append sflstr.h   sfl.h */
'type sflstr.h >> sfl.h'

/* append sflsock.h  sfl.h */
'type sflsock.h >> sfl.h'

/* append sflsymb.h  sfl.h */
'type sflsymb.h >> sfl.h'

/* append sflproc.h  sfl.h */
'type sflproc.h >> sfl.h'

/* append sflsyst.h  sfl.h */
'type sflsyst.h >> sfl.h'

/* append sflhttp.h  sfl.h */
'type sflhttp.h >> sfl.h'

/* append sflini.h   sfl.h */
'type sflini.h >> sfl.h'

/* append sflenv.h   sfl.h */
'type sflenv.h >> sfl.h'

/* append sfltok.h   sfl.h */
'type sfltok.h >> sfl.h'

/* append sfltree.h  sfl.h */
'type sfltree.h >> sfl.h'

/* append sfltron.h  sfl.h */
'type sfltron.h >> sfl.h'

/* append sfluid.h   sfl.h */
'type sfluid.h >> sfl.h'

/* append sflxml.h   sfl.h */
'type sflxml.h >> sfl.h'

/* append sflxmll.h  sfl.h */
'type sflxmll.h >> sfl.h'

exit 0
/* End script */

/* Utility subroutines ---------------------------------------------------- */

/* AssertFileExists <file>
 *
 * Checks to see if the specified file (argument 1) exists.  If it does the
 * subroutine returns.  If it doesn't, the subroutine displays an error
 * message, and exits the whole script.
 */

AssertFileExists:
fullpath = stream(ARG(1), 'C', 'QUERY EXISTS')
IF fullpath = "" THEN
DO
  SAY ARG(1) "missing -- aborting"
  exit 1
END

return

/* CompileToLib <source> <library>
 *
 * This is a stub routine to sort things out for compiling to a library.
 * We need to set CCLIBNAME to the name of the library, then call the 
 * 'c' script, then reset CCLIBNAME.  
 */

CompileToLib:

PARSE ARG SOURCE LIBRARY

oldenv  = VALUE('CCLIBNAME', LIBRARY, 'OS2ENVIRONMENT')
CALL c              SOURCE
CALL c '-r' LIBRARY SOURCE
LIBRARY = VALUE('CCLIBNAME', oldenv,  'OS2ENVIRONMENT')

return

/* CompileToObj <source>
 *
 * This is a stub routine to sort things out for compiling to an object.
 * We need to clear CCLIBNAME, then call c script with the "-c" parameter
 * to indicate compile only, and then reset CCLIBNAME again.
 */

CompileToObj:

SOURCE = ARG(1)

oldenv  = VALUE('CCLIBNAME', '',      'OS2ENVIRONMENT')
CALL c '-c' SOURCE
LIBRARY = VALUE('CCLIBNAME', oldenv,  'OS2ENVIRONMENT')

return

/* LinkProgram <name>
 *
 * This is a stub routine to sort out the things required for linking.
 * We call the c script with the "-L" parameter to link only.
 */

LinkProgram:

PROGRAM = ARG(1)
CALL c '-L' PROGRAM

return

/* End of Utility Subroutines (remaining functionality now in c.cmd) ------ */
