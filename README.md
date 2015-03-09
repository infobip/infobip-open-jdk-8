# OpenJDK Infobip fork

## Description
This is a fork of the official [OpenJDK](http://openjdk.java.net/) 1.8.0-40 release. All applied patches are in `patches` folder.

## Authors
* Milan Mimica


## Patches
### thread_name.cpp.patch
With [OpenJDK](http://openjdk.java.net/) on Linux, [JavaThread](http://docs.oracle.com/javase/7/docs/api/java/lang/Thread.html) names don't propagate to native threads.
You cannot see java thread name while inspecting native threads with any tool, like `top`, `htop`, or `ps`. This patch adds support for JVM to set native thread name on linux.

More info on the patch:

* https://bugs.openjdk.java.net/browse/JDK-7102541
* http://mail.openjdk.java.net/pipermail/hotspot-dev/2012-July/006211.html


### trace_allocations.diff
This patch adds two diagnostic options to the JVM.

* TraceLargerAllocations - logs every heap allocation larger than the specified size.
* G1TraceFullGCAllocations - logs allocations which trigger a STW Full GC.

Usage:

`java -XX:+UseG1GC -Xloggc:gc.log -XX:+PrintGCDateStamps -XX:+PrintGCDetails -XX:+UnlockDiagnosticVMOptions -XX:+G1TraceFullGCAllocations -XX:TraceLargerAllocations=500k`
