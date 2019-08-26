solo5 for Unikraft
===================

Once the build process finished successfully, The solo5 monitor(**solo5-hvt**)
as well as the corresponding app (for example, helloworld_solo5-x86_64) can be
found in the `build` directory and run with: ::

~/unikraft/apps/helloworld/build$ sudo ./solo5-hvt helloworld_solo5-x86_64
solo5-hvt: helloworld_solo5-x86_64: Warning: phdr[0] requests WRITE and EXEC permissions
            |      ___|
  __|  _ \  |  _ \ __ \
\__ \ (   | | (   |  ) |
____/\___/ _|\___/____/
Solo5: Memory map: 512 MB addressable:
Solo5:     unused @ (0x0 - 0xfffff)
Solo5:       text @ (0x100000 - 0x109f2e)
Solo5:     rodata @ (0x109f2f - 0x10dd07)
Solo5:       data @ (0x10dd08 - 0x112fff)
Solo5:       heap >= 0x113000 < stack < 0x20000000
Welcome to  _ __             _____
 __ _____  (_) /__ _______ _/ _/ /_
/ // / _ \/ /  '_// __/ _ `/ _/ __/
\_,_/_//_/_/_/\_\/_/  \_,_/_/ \__/
              Iapetus 0.3.1~798fdc8
Hello world!
Arguments:
Solo5: solo5_exit(0) called
~/unikraft/apps/helloworld/build$

The syntax of the **solo5-hvt** command is listed below, and you can also refer to
the solo5 project main page(https://github.com/Solo5/solo5) for more information ::

usage: solo5-hvt [ CORE OPTIONS ] [ MODULE OPTIONS ] [ -- ] KERNEL [ ARGS ]
KERNEL is the filename of the unikernel to run.
ARGS are optional arguments passed to the unikernel.
Core options:
  [ --mem=512 ] (guest memory in MB)
    --help (display this help)
Compiled-in modules: core dumpcore blk net gdb
Compiled-in module options:
    --dumpcore (enable guest core dump on abort/trap)
    --disk=IMAGE (file exposed to the unikernel as a raw block device)
    --net=TAP (host tap device for guest network interface or @NN tap fd)
    [ --net-mac=HWADDR ] (guest MAC address)
    --gdb (optional flag for running in a gdb debug session)
    [ --gdb-port=1234 ] (port to use)


Please also refer to the `README.md` as well as the documentation in the `doc/`
subdirectory of the main unikraft repository.

