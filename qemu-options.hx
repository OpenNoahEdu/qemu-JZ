HXCOMM Use DEFHEADING() to define headings in both help text and texi
HXCOMM Text between STEXI and ETEXI are copied to texi version and
HXCOMM discarded from C version
HXCOMM DEF(option, HAS_ARG/0, opt_enum, opt_help) is used to construct
HXCOMM option structures, enums and help message.
HXCOMM HXCOMM can be used for comments, discarded from both texi and C

DEFHEADING(Standard options:)
STEXI
@table @option
ETEXI

DEF("help", 0, QEMU_OPTION_h,
    "-h or -help     display this help and exit\n")
STEXI
@item -h
Display help and exit
ETEXI

DEF("version", 0, QEMU_OPTION_version,
    "-version        display version information and exit\n")
STEXI
@item -version
Display version information and exit
ETEXI

DEF("M", HAS_ARG, QEMU_OPTION_M,
    "-M machine      select emulated machine (-M ? for list)\n")
STEXI
@item -M @var{machine}
Select the emulated @var{machine} (@code{-M ?} for list)
ETEXI

DEF("cpu", HAS_ARG, QEMU_OPTION_cpu,
    "-cpu cpu        select CPU (-cpu ? for list)\n")
STEXI
@item -cpu @var{model}
Select CPU model (-cpu ? for list and additional feature selection)
ETEXI

DEF("smp", HAS_ARG, QEMU_OPTION_smp,
    "-smp n[,maxcpus=cpus][,cores=cores][,threads=threads][,sockets=sockets]\n"
    "                set the number of CPUs to 'n' [default=1]\n"
    "                maxcpus= maximum number of total cpus, including\n"
    "                  offline CPUs for hotplug etc.\n"
    "                cores= number of CPU cores on one socket\n"
    "                threads= number of threads on one CPU core\n"
    "                sockets= number of discrete sockets in the system\n")
STEXI
@item -smp @var{n}[,cores=@var{cores}][,threads=@var{threads}][,sockets=@var{sockets}][,maxcpus=@var{maxcpus}]
Simulate an SMP system with @var{n} CPUs. On the PC target, up to 255
CPUs are supported. On Sparc32 target, Linux limits the number of usable CPUs
to 4.
For the PC target, the number of @var{cores} per socket, the number
of @var{threads} per cores and the total number of @var{sockets} can be
specified. Missing values will be computed. If any on the three values is
given, the total number of CPUs @var{n} can be omitted. @var{maxcpus}
specifies the maximum number of hotpluggable CPUs.
ETEXI

DEF("numa", HAS_ARG, QEMU_OPTION_numa,
    "-numa node[,mem=size][,cpus=cpu[-cpu]][,nodeid=node]\n")
STEXI
@item -numa @var{opts}
Simulate a multi node NUMA system. If mem and cpus are omitted, resources
are split equally.
ETEXI

DEF("fda", HAS_ARG, QEMU_OPTION_fda,
    "-fda/-fdb file  use 'file' as floppy disk 0/1 image\n")
DEF("fdb", HAS_ARG, QEMU_OPTION_fdb, "")
STEXI
@item -fda @var{file}
@item -fdb @var{file}
Use @var{file} as floppy disk 0/1 image (@pxref{disk_images}). You can
use the host floppy by using @file{/dev/fd0} as filename (@pxref{host_drives}).
ETEXI

DEF("hda", HAS_ARG, QEMU_OPTION_hda,
    "-hda/-hdb file  use 'file' as IDE hard disk 0/1 image\n")
DEF("hdb", HAS_ARG, QEMU_OPTION_hdb, "")
DEF("hdc", HAS_ARG, QEMU_OPTION_hdc,
    "-hdc/-hdd file  use 'file' as IDE hard disk 2/3 image\n")
DEF("hdd", HAS_ARG, QEMU_OPTION_hdd, "")
STEXI
@item -hda @var{file}
@item -hdb @var{file}
@item -hdc @var{file}
@item -hdd @var{file}
Use @var{file} as hard disk 0, 1, 2 or 3 image (@pxref{disk_images}).
ETEXI

DEF("cdrom", HAS_ARG, QEMU_OPTION_cdrom,
    "-cdrom file     use 'file' as IDE cdrom image (cdrom is ide1 master)\n")
STEXI
@item -cdrom @var{file}
Use @var{file} as CD-ROM image (you cannot use @option{-hdc} and
@option{-cdrom} at the same time). You can use the host CD-ROM by
using @file{/dev/cdrom} as filename (@pxref{host_drives}).
ETEXI

DEF("drive", HAS_ARG, QEMU_OPTION_drive,
    "-drive [file=file][,if=type][,bus=n][,unit=m][,media=d][,index=i]\n"
    "       [,cyls=c,heads=h,secs=s[,trans=t]][,snapshot=on|off]\n"
    "       [,cache=writethrough|writeback|none][,format=f][,serial=s]\n"
    "       [,addr=A][,id=name][,aio=threads|native]\n"
    "                use 'file' as a drive image\n")
DEF("set", HAS_ARG, QEMU_OPTION_set,
    "-set group.id.arg=value\n"
    "                set <arg> parameter for item <id> of type <group>\n"
    "                i.e. -set drive.$id.file=/path/to/image\n")
STEXI
@item -drive @var{option}[,@var{option}[,@var{option}[,...]]]

Define a new drive. Valid options are:

@table @option
@item file=@var{file}
This option defines which disk image (@pxref{disk_images}) to use with
this drive. If the filename contains comma, you must double it
(for instance, "file=my,,file" to use file "my,file").
@item if=@var{interface}
This option defines on which type on interface the drive is connected.
Available types are: ide, scsi, sd, mtd, floppy, pflash, virtio.
@item bus=@var{bus},unit=@var{unit}
These options define where is connected the drive by defining the bus number and
the unit id.
@item index=@var{index}
This option defines where is connected the drive by using an index in the list
of available connectors of a given interface type.
@item media=@var{media}
This option defines the type of the media: disk or cdrom.
@item cyls=@var{c},heads=@var{h},secs=@var{s}[,trans=@var{t}]
These options have the same definition as they have in @option{-hdachs}.
@item snapshot=@var{snapshot}
@var{snapshot} is "on" or "off" and allows to enable snapshot for given drive (see @option{-snapshot}).
@item cache=@var{cache}
@var{cache} is "none", "writeback", or "writethrough" and controls how the host cache is used to access block data.
@item aio=@var{aio}
@var{aio} is "threads", or "native" and selects between pthread based disk I/O and native Linux AIO.
@item format=@var{format}
Specify which disk @var{format} will be used rather than detecting
the format.  Can be used to specifiy format=raw to avoid interpreting
an untrusted format header.
@item serial=@var{serial}
This option specifies the serial number to assign to the device.
@item addr=@var{addr}
Specify the controller's PCI address (if=virtio only).
@end table

By default, writethrough caching is used for all block device.  This means that
the host page cache will be used to read and write data but write notification
will be sent to the guest only when the data has been reported as written by
the storage subsystem.

Writeback caching will report data writes as completed as soon as the data is
present in the host page cache.  This is safe as long as you trust your host.
If your host crashes or loses power, then the guest may experience data
corruption.  When using the @option{-snapshot} option, writeback caching is
used by default.

The host page cache can be avoided entirely with @option{cache=none}.  This will
attempt to do disk IO directly to the guests memory.  QEMU may still perform
an internal copy of the data.

Some block drivers perform badly with @option{cache=writethrough}, most notably,
qcow2.  If performance is more important than correctness,
@option{cache=writeback} should be used with qcow2.

Instead of @option{-cdrom} you can use:
@example
qemu -drive file=file,index=2,media=cdrom
@end example

Instead of @option{-hda}, @option{-hdb}, @option{-hdc}, @option{-hdd}, you can
use:
@example
qemu -drive file=file,index=0,media=disk
qemu -drive file=file,index=1,media=disk
qemu -drive file=file,index=2,media=disk
qemu -drive file=file,index=3,media=disk
@end example

You can connect a CDROM to the slave of ide0:
@example
qemu -drive file=file,if=ide,index=1,media=cdrom
@end example

If you don't specify the "file=" argument, you define an empty drive:
@example
qemu -drive if=ide,index=1,media=cdrom
@end example

You can connect a SCSI disk with unit ID 6 on the bus #0:
@example
qemu -drive file=file,if=scsi,bus=0,unit=6
@end example

Instead of @option{-fda}, @option{-fdb}, you can use:
@example
qemu -drive file=file,index=0,if=floppy
qemu -drive file=file,index=1,if=floppy
@end example

By default, @var{interface} is "ide" and @var{index} is automatically
incremented:
@example
qemu -drive file=a -drive file=b"
@end example
is interpreted like:
@example
qemu -hda a -hdb b
@end example
ETEXI

DEF("mtdblock", HAS_ARG, QEMU_OPTION_mtdblock,
    "-mtdblock file  use 'file' as on-board Flash memory image\n")
STEXI

@item -mtdblock @var{file}
Use @var{file} as on-board Flash memory image.
ETEXI

DEF("sd", HAS_ARG, QEMU_OPTION_sd,
    "-sd file        use 'file' as SecureDigital card image\n")
STEXI
@item -sd @var{file}
Use @var{file} as SecureDigital card image.
ETEXI

DEF("pflash", HAS_ARG, QEMU_OPTION_pflash,
    "-pflash file    use 'file' as a parallel flash image\n")
STEXI
@item -pflash @var{file}
Use @var{file} as a parallel flash image.
ETEXI

DEF("boot", HAS_ARG, QEMU_OPTION_boot,
    "-boot [order=drives][,once=drives][,menu=on|off]\n"
    "                'drives': floppy (a), hard disk (c), CD-ROM (d), network (n)\n")
STEXI
@item -boot [order=@var{drives}][,once=@var{drives}][,menu=on|off]

Specify boot order @var{drives} as a string of drive letters. Valid
drive letters depend on the target achitecture. The x86 PC uses: a, b
(floppy 1 and 2), c (first hard disk), d (first CD-ROM), n-p (Etherboot
from network adapter 1-4), hard disk boot is the default. To apply a
particular boot order only on the first startup, specify it via
@option{once}.

Interactive boot menus/prompts can be enabled via @option{menu=on} as far
as firmware/BIOS supports them. The default is non-interactive boot.

@example
# try to boot from network first, then from hard disk
qemu -boot order=nc
# boot from CD-ROM first, switch back to default order after reboot
qemu -boot once=d
@end example

Note: The legacy format '-boot @var{drives}' is still supported but its
use is discouraged as it may be removed from future versions.
ETEXI

DEF("snapshot", 0, QEMU_OPTION_snapshot,
    "-snapshot       write to temporary files instead of disk image files\n")
STEXI
@item -snapshot
Write to temporary files instead of disk image files. In this case,
the raw disk image you use is not written back. You can however force
the write back by pressing @key{C-a s} (@pxref{disk_images}).
ETEXI

DEF("m", HAS_ARG, QEMU_OPTION_m,
    "-m megs         set virtual RAM size to megs MB [default=%d]\n")
STEXI
@item -m @var{megs}
Set virtual RAM size to @var{megs} megabytes. Default is 128 MiB.  Optionally,
a suffix of ``M'' or ``G'' can be used to signify a value in megabytes or
gigabytes respectively.
ETEXI

DEF("k", HAS_ARG, QEMU_OPTION_k,
    "-k language     use keyboard layout (for example 'fr' for French)\n")
STEXI
@item -k @var{language}

Use keyboard layout @var{language} (for example @code{fr} for
French). This option is only needed where it is not easy to get raw PC
keycodes (e.g. on Macs, with some X11 servers or with a VNC
display). You don't normally need to use it on PC/Linux or PC/Windows
hosts.

The available layouts are:
@example
ar  de-ch  es  fo     fr-ca  hu  ja  mk     no  pt-br  sv
da  en-gb  et  fr     fr-ch  is  lt  nl     pl  ru     th
de  en-us  fi  fr-be  hr     it  lv  nl-be  pt  sl     tr
@end example

The default is @code{en-us}.
ETEXI


#ifdef HAS_AUDIO
DEF("audio-help", 0, QEMU_OPTION_audio_help,
    "-audio-help     print list of audio drivers and their options\n")
#endif
STEXI
@item -audio-help

Will show the audio subsystem help: list of drivers, tunable
parameters.
ETEXI

#ifdef HAS_AUDIO
DEF("soundhw", HAS_ARG, QEMU_OPTION_soundhw,
    "-soundhw c1,... enable audio support\n"
    "                and only specified sound cards (comma separated list)\n"
    "                use -soundhw ? to get the list of supported cards\n"
    "                use -soundhw all to enable all of them\n")
#endif
STEXI
@item -soundhw @var{card1}[,@var{card2},...] or -soundhw all

Enable audio and selected sound hardware. Use ? to print all
available sound hardware.

@example
qemu -soundhw sb16,adlib disk.img
qemu -soundhw es1370 disk.img
qemu -soundhw ac97 disk.img
qemu -soundhw all disk.img
qemu -soundhw ?
@end example

Note that Linux's i810_audio OSS kernel (for AC97) module might
require manually specifying clocking.

@example
modprobe i810_audio clocking=48000
@end example
ETEXI

STEXI
@end table
ETEXI

DEF("usb", 0, QEMU_OPTION_usb,
    "-usb            enable the USB driver (will be the default soon)\n")
STEXI
USB options:
@table @option

@item -usb
Enable the USB driver (will be the default soon)
ETEXI

DEF("usbdevice", HAS_ARG, QEMU_OPTION_usbdevice,
    "-usbdevice name add the host or guest USB device 'name'\n")
STEXI

@item -usbdevice @var{devname}
Add the USB device @var{devname}. @xref{usb_devices}.

@table @option

@item mouse
Virtual Mouse. This will override the PS/2 mouse emulation when activated.

@item tablet
Pointer device that uses absolute coordinates (like a touchscreen). This
means qemu is able to report the mouse position without having to grab the
mouse. Also overrides the PS/2 mouse emulation when activated.

@item disk:[format=@var{format}]:@var{file}
Mass storage device based on file. The optional @var{format} argument
will be used rather than detecting the format. Can be used to specifiy
@code{format=raw} to avoid interpreting an untrusted format header.

@item host:@var{bus}.@var{addr}
Pass through the host device identified by @var{bus}.@var{addr} (Linux only).

@item host:@var{vendor_id}:@var{product_id}
Pass through the host device identified by @var{vendor_id}:@var{product_id}
(Linux only).

@item serial:[vendorid=@var{vendor_id}][,productid=@var{product_id}]:@var{dev}
Serial converter to host character device @var{dev}, see @code{-serial} for the
available devices.

@item braille
Braille device.  This will use BrlAPI to display the braille output on a real
or fake device.

@item net:@var{options}
Network adapter that supports CDC ethernet and RNDIS protocols.

@end table
ETEXI

DEF("device", HAS_ARG, QEMU_OPTION_device,
    "-device driver[,options]  add device\n")
DEF("name", HAS_ARG, QEMU_OPTION_name,
    "-name string1[,process=string2]    set the name of the guest\n"
    "            string1 sets the window title and string2 the process name (on Linux)\n")
STEXI
@item -name @var{name}
Sets the @var{name} of the guest.
This name will be displayed in the SDL window caption.
The @var{name} will also be used for the VNC server.
Also optionally set the top visible process name in Linux.
ETEXI

DEF("uuid", HAS_ARG, QEMU_OPTION_uuid,
    "-uuid %%08x-%%04x-%%04x-%%04x-%%012x\n"
    "                specify machine UUID\n")
STEXI
@item -uuid @var{uuid}
Set system UUID.
ETEXI

STEXI
@end table
ETEXI

DEFHEADING()

DEFHEADING(Display options:)

STEXI
@table @option
ETEXI

DEF("nographic", 0, QEMU_OPTION_nographic,
    "-nographic      disable graphical output and redirect serial I/Os to console\n")
STEXI
@item -nographic

Normally, QEMU uses SDL to display the VGA output. With this option,
you can totally disable graphical output so that QEMU is a simple
command line application. The emulated serial port is redirected on
the console. Therefore, you can still use QEMU to debug a Linux kernel
with a serial console.
ETEXI

#ifdef CONFIG_CURSES
DEF("curses", 0, QEMU_OPTION_curses,
    "-curses         use a curses/ncurses interface instead of SDL\n")
#endif
STEXI
@item -curses

Normally, QEMU uses SDL to display the VGA output.  With this option,
QEMU can display the VGA output when in text mode using a
curses/ncurses interface.  Nothing is displayed in graphical mode.
ETEXI

#ifdef CONFIG_SDL
DEF("no-frame", 0, QEMU_OPTION_no_frame,
    "-no-frame       open SDL window without a frame and window decorations\n")
#endif
STEXI
@item -no-frame

Do not use decorations for SDL windows and start them using the whole
available screen space. This makes the using QEMU in a dedicated desktop
workspace more convenient.
ETEXI

#ifdef CONFIG_SDL
DEF("alt-grab", 0, QEMU_OPTION_alt_grab,
    "-alt-grab       use Ctrl-Alt-Shift to grab mouse (instead of Ctrl-Alt)\n")
#endif
STEXI
@item -alt-grab

Use Ctrl-Alt-Shift to grab mouse (instead of Ctrl-Alt).
ETEXI

#ifdef CONFIG_SDL
DEF("ctrl-grab", 0, QEMU_OPTION_ctrl_grab,
    "-ctrl-grab       use Right-Ctrl to grab mouse (instead of Ctrl-Alt)\n")
#endif
STEXI
@item -ctrl-grab

Use Right-Ctrl to grab mouse (instead of Ctrl-Alt).
ETEXI

#ifdef CONFIG_SDL
DEF("no-quit", 0, QEMU_OPTION_no_quit,
    "-no-quit        disable SDL window close capability\n")
#endif
STEXI
@item -no-quit

Disable SDL window close capability.
ETEXI

#ifdef CONFIG_SDL
DEF("sdl", 0, QEMU_OPTION_sdl,
    "-sdl            enable SDL\n")
#endif
STEXI
@item -sdl

Enable SDL.
ETEXI

DEF("portrait", 0, QEMU_OPTION_portrait,
    "-portrait       rotate graphical output 90 deg left (only PXA LCD)\n")
STEXI
@item -portrait

Rotate graphical output 90 deg left (only PXA LCD).
ETEXI

DEF("vga", HAS_ARG, QEMU_OPTION_vga,
    "-vga [std|cirrus|vmware|xenfb|none]\n"
    "                select video card type\n")
STEXI
@item -vga @var{type}
Select type of VGA card to emulate. Valid values for @var{type} are
@table @option
@item cirrus
Cirrus Logic GD5446 Video card. All Windows versions starting from
Windows 95 should recognize and use this graphic card. For optimal
performances, use 16 bit color depth in the guest and the host OS.
(This one is the default)
@item std
Standard VGA card with Bochs VBE extensions.  If your guest OS
supports the VESA 2.0 VBE extensions (e.g. Windows XP) and if you want
to use high resolution modes (>= 1280x1024x16) then you should use
this option.
@item vmware
VMWare SVGA-II compatible adapter. Use it if you have sufficiently
recent XFree86/XOrg server or Windows guest with a driver for this
card.
@item none
Disable VGA card.
@end table
ETEXI

DEF("full-screen", 0, QEMU_OPTION_full_screen,
    "-full-screen    start in full screen\n")
STEXI
@item -full-screen
Start in full screen.
ETEXI

#if defined(TARGET_PPC) || defined(TARGET_SPARC)
DEF("g", 1, QEMU_OPTION_g ,
    "-g WxH[xDEPTH]  Set the initial graphical resolution and depth\n")
#endif
STEXI
ETEXI

DEF("vnc", HAS_ARG, QEMU_OPTION_vnc ,
    "-vnc display    start a VNC server on display\n")
STEXI
@item -vnc @var{display}[,@var{option}[,@var{option}[,...]]]

Normally, QEMU uses SDL to display the VGA output.  With this option,
you can have QEMU listen on VNC display @var{display} and redirect the VGA
display over the VNC session.  It is very useful to enable the usb
tablet device when using this option (option @option{-usbdevice
tablet}). When using the VNC display, you must use the @option{-k}
parameter to set the keyboard layout if you are not using en-us. Valid
syntax for the @var{display} is

@table @option

@item @var{host}:@var{d}

TCP connections will only be allowed from @var{host} on display @var{d}.
By convention the TCP port is 5900+@var{d}. Optionally, @var{host} can
be omitted in which case the server will accept connections from any host.

@item unix:@var{path}

Connections will be allowed over UNIX domain sockets where @var{path} is the
location of a unix socket to listen for connections on.

@item none

VNC is initialized but not started. The monitor @code{change} command
can be used to later start the VNC server.

@end table

Following the @var{display} value there may be one or more @var{option} flags
separated by commas. Valid options are

@table @option

@item reverse

Connect to a listening VNC client via a ``reverse'' connection. The
client is specified by the @var{display}. For reverse network
connections (@var{host}:@var{d},@code{reverse}), the @var{d} argument
is a TCP port number, not a display number.

@item password

Require that password based authentication is used for client connections.
The password must be set separately using the @code{change} command in the
@ref{pcsys_monitor}

@item tls

Require that client use TLS when communicating with the VNC server. This
uses anonymous TLS credentials so is susceptible to a man-in-the-middle
attack. It is recommended that this option be combined with either the
@option{x509} or @option{x509verify} options.

@item x509=@var{/path/to/certificate/dir}

Valid if @option{tls} is specified. Require that x509 credentials are used
for negotiating the TLS session. The server will send its x509 certificate
to the client. It is recommended that a password be set on the VNC server
to provide authentication of the client when this is used. The path following
this option specifies where the x509 certificates are to be loaded from.
See the @ref{vnc_security} section for details on generating certificates.

@item x509verify=@var{/path/to/certificate/dir}

Valid if @option{tls} is specified. Require that x509 credentials are used
for negotiating the TLS session. The server will send its x509 certificate
to the client, and request that the client send its own x509 certificate.
The server will validate the client's certificate against the CA certificate,
and reject clients when validation fails. If the certificate authority is
trusted, this is a sufficient authentication mechanism. You may still wish
to set a password on the VNC server as a second authentication layer. The
path following this option specifies where the x509 certificates are to
be loaded from. See the @ref{vnc_security} section for details on generating
certificates.

@item sasl

Require that the client use SASL to authenticate with the VNC server.
The exact choice of authentication method used is controlled from the
system / user's SASL configuration file for the 'qemu' service. This
is typically found in /etc/sasl2/qemu.conf. If running QEMU as an
unprivileged user, an environment variable SASL_CONF_PATH can be used
to make it search alternate locations for the service config.
While some SASL auth methods can also provide data encryption (eg GSSAPI),
it is recommended that SASL always be combined with the 'tls' and
'x509' settings to enable use of SSL and server certificates. This
ensures a data encryption preventing compromise of authentication
credentials. See the @ref{vnc_security} section for details on using
SASL authentication.

@item acl

Turn on access control lists for checking of the x509 client certificate
and SASL party. For x509 certs, the ACL check is made against the
certificate's distinguished name. This is something that looks like
@code{C=GB,O=ACME,L=Boston,CN=bob}. For SASL party, the ACL check is
made against the username, which depending on the SASL plugin, may
include a realm component, eg @code{bob} or @code{bob@@EXAMPLE.COM}.
When the @option{acl} flag is set, the initial access list will be
empty, with a @code{deny} policy. Thus no one will be allowed to
use the VNC server until the ACLs have been loaded. This can be
achieved using the @code{acl} monitor command.

@end table
ETEXI

STEXI
@end table
ETEXI

DEFHEADING()

#ifdef TARGET_I386
DEFHEADING(i386 target only:)
#endif
STEXI
@table @option
ETEXI

#ifdef TARGET_I386
DEF("win2k-hack", 0, QEMU_OPTION_win2k_hack,
    "-win2k-hack     use it when installing Windows 2000 to avoid a disk full bug\n")
#endif
STEXI
@item -win2k-hack
Use it when installing Windows 2000 to avoid a disk full bug. After
Windows 2000 is installed, you no longer need this option (this option
slows down the IDE transfers).
ETEXI

#ifdef TARGET_I386
HXCOMM Deprecated by -rtc
DEF("rtc-td-hack", 0, QEMU_OPTION_rtc_td_hack, "")
#endif

#ifdef TARGET_I386
DEF("no-fd-bootchk", 0, QEMU_OPTION_no_fd_bootchk,
    "-no-fd-bootchk  disable boot signature checking for floppy disks\n")
#endif
STEXI
@item -no-fd-bootchk
Disable boot signature checking for floppy disks in Bochs BIOS. It may
be needed to boot from old floppy disks.
ETEXI

#ifdef TARGET_I386
DEF("no-acpi", 0, QEMU_OPTION_no_acpi,
           "-no-acpi        disable ACPI\n")
#endif
STEXI
@item -no-acpi
Disable ACPI (Advanced Configuration and Power Interface) support. Use
it if your guest OS complains about ACPI problems (PC target machine
only).
ETEXI

#ifdef TARGET_I386
DEF("no-hpet", 0, QEMU_OPTION_no_hpet,
    "-no-hpet        disable HPET\n")
#endif
STEXI
@item -no-hpet
Disable HPET support.
ETEXI

#ifdef TARGET_I386
DEF("balloon", HAS_ARG, QEMU_OPTION_balloon,
    "-balloon none   disable balloon device\n"
    "-balloon virtio[,addr=str]\n"
    "                enable virtio balloon device (default)\n")
#endif
STEXI
@item -balloon none
Disable balloon device.
@item -balloon virtio[,addr=@var{addr}]
Enable virtio balloon device (default), optionally with PCI address
@var{addr}.
ETEXI

#ifdef TARGET_I386
DEF("acpitable", HAS_ARG, QEMU_OPTION_acpitable,
    "-acpitable [sig=str][,rev=n][,oem_id=str][,oem_table_id=str][,oem_rev=n][,asl_compiler_id=str][,asl_compiler_rev=n][,data=file1[:file2]...]\n"
    "                ACPI table description\n")
#endif
STEXI
@item -acpitable [sig=@var{str}][,rev=@var{n}][,oem_id=@var{str}][,oem_table_id=@var{str}][,oem_rev=@var{n}] [,asl_compiler_id=@var{str}][,asl_compiler_rev=@var{n}][,data=@var{file1}[:@var{file2}]...]
Add ACPI table with specified header fields and context from specified files.
ETEXI

#ifdef TARGET_I386
DEF("smbios", HAS_ARG, QEMU_OPTION_smbios,
    "-smbios file=binary\n"
    "                Load SMBIOS entry from binary file\n"
    "-smbios type=0[,vendor=str][,version=str][,date=str][,release=%%d.%%d]\n"
    "                Specify SMBIOS type 0 fields\n"
    "-smbios type=1[,manufacturer=str][,product=str][,version=str][,serial=str]\n"
    "              [,uuid=uuid][,sku=str][,family=str]\n"
    "                Specify SMBIOS type 1 fields\n")
#endif
STEXI
@item -smbios file=@var{binary}
Load SMBIOS entry from binary file.

@item -smbios type=0[,vendor=@var{str}][,version=@var{str}][,date=@var{str}][,release=@var{%d.%d}]
Specify SMBIOS type 0 fields

@item -smbios type=1[,manufacturer=@var{str}][,product=@var{str}][,version=@var{str}][,serial=@var{str}][,uuid=@var{uuid}][,sku=@var{str}][,family=@var{str}]
Specify SMBIOS type 1 fields
ETEXI

#ifdef TARGET_I386
DEFHEADING()
#endif
STEXI
@end table
ETEXI

DEFHEADING(Network options:)
STEXI
@table @option
ETEXI

HXCOMM Legacy slirp options (now moved to -net user):
#ifdef CONFIG_SLIRP
DEF("tftp", HAS_ARG, QEMU_OPTION_tftp, "")
DEF("bootp", HAS_ARG, QEMU_OPTION_bootp, "")
DEF("redir", HAS_ARG, QEMU_OPTION_redir, "")
#ifndef _WIN32
DEF("smb", HAS_ARG, QEMU_OPTION_smb, "")
#endif
#endif

DEF("net", HAS_ARG, QEMU_OPTION_net,
    "-net nic[,vlan=n][,macaddr=mac][,model=type][,name=str][,addr=str][,vectors=v]\n"
    "                create a new Network Interface Card and connect it to VLAN 'n'\n"
#ifdef CONFIG_SLIRP
    "-net user[,vlan=n][,name=str][,net=addr[/mask]][,host=addr][,restrict=y|n]\n"
    "         [,hostname=host][,dhcpstart=addr][,dns=addr][,tftp=dir][,bootfile=f]\n"
    "         [,hostfwd=rule][,guestfwd=rule]"
#ifndef _WIN32
                                             "[,smb=dir[,smbserver=addr]]\n"
#endif
    "                connect the user mode network stack to VLAN 'n', configure its\n"
    "                DHCP server and enabled optional services\n"
#endif
#ifdef _WIN32
    "-net tap[,vlan=n][,name=str],ifname=name\n"
    "                connect the host TAP network interface to VLAN 'n'\n"
#else
    "-net tap[,vlan=n][,name=str][,fd=h][,ifname=name][,script=file][,downscript=dfile][,sndbuf=nbytes][,vnet_hdr=on|off]\n"
    "                connect the host TAP network interface to VLAN 'n' and use the\n"
    "                network scripts 'file' (default=%s)\n"
    "                and 'dfile' (default=%s);\n"
    "                use '[down]script=no' to disable script execution;\n"
    "                use 'fd=h' to connect to an already opened TAP interface\n"
    "                use 'sndbuf=nbytes' to limit the size of the send buffer; the\n"
    "                default of 'sndbuf=1048576' can be disabled using 'sndbuf=0'\n"
    "                use vnet_hdr=off to avoid enabling the IFF_VNET_HDR tap flag; use\n"
    "                vnet_hdr=on to make the lack of IFF_VNET_HDR support an error condition\n"
#endif
    "-net socket[,vlan=n][,name=str][,fd=h][,listen=[host]:port][,connect=host:port]\n"
    "                connect the vlan 'n' to another VLAN using a socket connection\n"
    "-net socket[,vlan=n][,name=str][,fd=h][,mcast=maddr:port]\n"
    "                connect the vlan 'n' to multicast maddr and port\n"
#ifdef CONFIG_VDE
    "-net vde[,vlan=n][,name=str][,sock=socketpath][,port=n][,group=groupname][,mode=octalmode]\n"
    "                connect the vlan 'n' to port 'n' of a vde switch running\n"
    "                on host and listening for incoming connections on 'socketpath'.\n"
    "                Use group 'groupname' and mode 'octalmode' to change default\n"
    "                ownership and permissions for communication port.\n"
#endif
    "-net dump[,vlan=n][,file=f][,len=n]\n"
    "                dump traffic on vlan 'n' to file 'f' (max n bytes per packet)\n"
    "-net none       use it alone to have zero network devices; if no -net option\n"
    "                is provided, the default is '-net nic -net user'\n")
DEF("netdev", HAS_ARG, QEMU_OPTION_netdev,
    "-netdev ["
#ifdef CONFIG_SLIRP
    "user|"
#endif
    "tap|"
#ifdef CONFIG_VDE
    "vde|"
#endif
    "socket],id=str[,option][,option][,...]\n")
STEXI
@item -net nic[,vlan=@var{n}][,macaddr=@var{mac}][,model=@var{type}][,name=@var{name}][,addr=@var{addr}][,vectors=@var{v}]
Create a new Network Interface Card and connect it to VLAN @var{n} (@var{n}
= 0 is the default). The NIC is an e1000 by default on the PC
target. Optionally, the MAC address can be changed to @var{mac}, the
device address set to @var{addr} (PCI cards only),
and a @var{name} can be assigned for use in monitor commands.
Optionally, for PCI cards, you can specify the number @var{v} of MSI-X vectors
that the card should have; this option currently only affects virtio cards; set
@var{v} = 0 to disable MSI-X. If no @option{-net} option is specified, a single
NIC is created.  Qemu can emulate several different models of network card.
Valid values for @var{type} are
@code{virtio}, @code{i82551}, @code{i82557b}, @code{i82559er},
@code{ne2k_pci}, @code{ne2k_isa}, @code{pcnet}, @code{rtl8139},
@code{e1000}, @code{smc91c111}, @code{lance} and @code{mcf_fec}.
Not all devices are supported on all targets.  Use -net nic,model=?
for a list of available devices for your target.

@item -net user[,@var{option}][,@var{option}][,...]
Use the user mode network stack which requires no administrator
privilege to run. Valid options are:

@table @option
@item vlan=@var{n}
Connect user mode stack to VLAN @var{n} (@var{n} = 0 is the default).

@item name=@var{name}
Assign symbolic name for use in monitor commands.

@item net=@var{addr}[/@var{mask}]
Set IP network address the guest will see. Optionally specify the netmask,
either in the form a.b.c.d or as number of valid top-most bits. Default is
10.0.2.0/8.

@item host=@var{addr}
Specify the guest-visible address of the host. Default is the 2nd IP in the
guest network, i.e. x.x.x.2.

@item restrict=y|yes|n|no
If this options is enabled, the guest will be isolated, i.e. it will not be
able to contact the host and no guest IP packets will be routed over the host
to the outside. This option does not affect explicitly set forwarding rule.

@item hostname=@var{name}
Specifies the client hostname reported by the builtin DHCP server.

@item dhcpstart=@var{addr}
Specify the first of the 16 IPs the built-in DHCP server can assign. Default
is the 16th to 31st IP in the guest network, i.e. x.x.x.16 to x.x.x.31.

@item dns=@var{addr}
Specify the guest-visible address of the virtual nameserver. The address must
be different from the host address. Default is the 3rd IP in the guest network,
i.e. x.x.x.3.

@item tftp=@var{dir}
When using the user mode network stack, activate a built-in TFTP
server. The files in @var{dir} will be exposed as the root of a TFTP server.
The TFTP client on the guest must be configured in binary mode (use the command
@code{bin} of the Unix TFTP client).

@item bootfile=@var{file}
When using the user mode network stack, broadcast @var{file} as the BOOTP
filename. In conjunction with @option{tftp}, this can be used to network boot
a guest from a local directory.

Example (using pxelinux):
@example
qemu -hda linux.img -boot n -net user,tftp=/path/to/tftp/files,bootfile=/pxelinux.0
@end example

@item smb=@var{dir}[,smbserver=@var{addr}]
When using the user mode network stack, activate a built-in SMB
server so that Windows OSes can access to the host files in @file{@var{dir}}
transparently. The IP address of the SMB server can be set to @var{addr}. By
default the 4th IP in the guest network is used, i.e. x.x.x.4.

In the guest Windows OS, the line:
@example
10.0.2.4 smbserver
@end example
must be added in the file @file{C:\WINDOWS\LMHOSTS} (for windows 9x/Me)
or @file{C:\WINNT\SYSTEM32\DRIVERS\ETC\LMHOSTS} (Windows NT/2000).

Then @file{@var{dir}} can be accessed in @file{\\smbserver\qemu}.

Note that a SAMBA server must be installed on the host OS in
@file{/usr/sbin/smbd}. QEMU was tested successfully with smbd versions from
Red Hat 9, Fedora Core 3 and OpenSUSE 11.x.

@item hostfwd=[tcp|udp]:[@var{hostaddr}]:@var{hostport}-[@var{guestaddr}]:@var{guestport}
Redirect incoming TCP or UDP connections to the host port @var{hostport} to
the guest IP address @var{guestaddr} on guest port @var{guestport}. If
@var{guestaddr} is not specified, its value is x.x.x.15 (default first address
given by the built-in DHCP server). By specifying @var{hostaddr}, the rule can
be bound to a specific host interface. If no connection type is set, TCP is
used. This option can be given multiple times.

For example, to redirect host X11 connection from screen 1 to guest
screen 0, use the following:

@example
# on the host
qemu -net user,hostfwd=tcp:127.0.0.1:6001-:6000 [...]
# this host xterm should open in the guest X11 server
xterm -display :1
@end example

To redirect telnet connections from host port 5555 to telnet port on
the guest, use the following:

@example
# on the host
qemu -net user,hostfwd=tcp:5555::23 [...]
telnet localhost 5555
@end example

Then when you use on the host @code{telnet localhost 5555}, you
connect to the guest telnet server.

@item guestfwd=[tcp]:@var{server}:@var{port}-@var{dev}
Forward guest TCP connections to the IP address @var{server} on port @var{port}
to the character device @var{dev}. This option can be given multiple times.

@end table

Note: Legacy stand-alone options -tftp, -bootp, -smb and -redir are still
processed and applied to -net user. Mixing them with the new configuration
syntax gives undefined results. Their use for new applications is discouraged
as they will be removed from future versions.

@item -net tap[,vlan=@var{n}][,name=@var{name}][,fd=@var{h}][,ifname=@var{name}][,script=@var{file}][,downscript=@var{dfile}]
Connect the host TAP network interface @var{name} to VLAN @var{n}, use
the network script @var{file} to configure it and the network script
@var{dfile} to deconfigure it. If @var{name} is not provided, the OS
automatically provides one. @option{fd}=@var{h} can be used to specify
the handle of an already opened host TAP interface. The default network
configure script is @file{/etc/qemu-ifup} and the default network
deconfigure script is @file{/etc/qemu-ifdown}. Use @option{script=no}
or @option{downscript=no} to disable script execution. Example:

@example
qemu linux.img -net nic -net tap
@end example

More complicated example (two NICs, each one connected to a TAP device)
@example
qemu linux.img -net nic,vlan=0 -net tap,vlan=0,ifname=tap0 \
               -net nic,vlan=1 -net tap,vlan=1,ifname=tap1
@end example

@item -net socket[,vlan=@var{n}][,name=@var{name}][,fd=@var{h}][,listen=[@var{host}]:@var{port}][,connect=@var{host}:@var{port}]

Connect the VLAN @var{n} to a remote VLAN in another QEMU virtual
machine using a TCP socket connection. If @option{listen} is
specified, QEMU waits for incoming connections on @var{port}
(@var{host} is optional). @option{connect} is used to connect to
another QEMU instance using the @option{listen} option. @option{fd}=@var{h}
specifies an already opened TCP socket.

Example:
@example
# launch a first QEMU instance
qemu linux.img -net nic,macaddr=52:54:00:12:34:56 \
               -net socket,listen=:1234
# connect the VLAN 0 of this instance to the VLAN 0
# of the first instance
qemu linux.img -net nic,macaddr=52:54:00:12:34:57 \
               -net socket,connect=127.0.0.1:1234
@end example

@item -net socket[,vlan=@var{n}][,name=@var{name}][,fd=@var{h}][,mcast=@var{maddr}:@var{port}]

Create a VLAN @var{n} shared with another QEMU virtual
machines using a UDP multicast socket, effectively making a bus for
every QEMU with same multicast address @var{maddr} and @var{port}.
NOTES:
@enumerate
@item
Several QEMU can be running on different hosts and share same bus (assuming
correct multicast setup for these hosts).
@item
mcast support is compatible with User Mode Linux (argument @option{eth@var{N}=mcast}), see
@url{http://user-mode-linux.sf.net}.
@item
Use @option{fd=h} to specify an already opened UDP multicast socket.
@end enumerate

Example:
@example
# launch one QEMU instance
qemu linux.img -net nic,macaddr=52:54:00:12:34:56 \
               -net socket,mcast=230.0.0.1:1234
# launch another QEMU instance on same "bus"
qemu linux.img -net nic,macaddr=52:54:00:12:34:57 \
               -net socket,mcast=230.0.0.1:1234
# launch yet another QEMU instance on same "bus"
qemu linux.img -net nic,macaddr=52:54:00:12:34:58 \
               -net socket,mcast=230.0.0.1:1234
@end example

Example (User Mode Linux compat.):
@example
# launch QEMU instance (note mcast address selected
# is UML's default)
qemu linux.img -net nic,macaddr=52:54:00:12:34:56 \
               -net socket,mcast=239.192.168.1:1102
# launch UML
/path/to/linux ubd0=/path/to/root_fs eth0=mcast
@end example

@item -net vde[,vlan=@var{n}][,name=@var{name}][,sock=@var{socketpath}][,port=@var{n}][,group=@var{groupname}][,mode=@var{octalmode}]
Connect VLAN @var{n} to PORT @var{n} of a vde switch running on host and
listening for incoming connections on @var{socketpath}. Use GROUP @var{groupname}
and MODE @var{octalmode} to change default ownership and permissions for
communication port. This option is available only if QEMU has been compiled
with vde support enabled.

Example:
@example
# launch vde switch
vde_switch -F -sock /tmp/myswitch
# launch QEMU instance
qemu linux.img -net nic -net vde,sock=/tmp/myswitch
@end example

@item -net dump[,vlan=@var{n}][,file=@var{file}][,len=@var{len}]
Dump network traffic on VLAN @var{n} to file @var{file} (@file{qemu-vlan0.pcap} by default).
At most @var{len} bytes (64k by default) per packet are stored. The file format is
libpcap, so it can be analyzed with tools such as tcpdump or Wireshark.

@item -net none
Indicate that no network devices should be configured. It is used to
override the default configuration (@option{-net nic -net user}) which
is activated if no @option{-net} options are provided.

@end table
ETEXI

DEFHEADING()

DEFHEADING(Character device options:)

DEF("chardev", HAS_ARG, QEMU_OPTION_chardev,
    "-chardev null,id=id\n"
    "-chardev socket,id=id[,host=host],port=host[,to=to][,ipv4][,ipv6][,nodelay]\n"
    "         [,server][,nowait][,telnet] (tcp)\n"
    "-chardev socket,id=id,path=path[,server][,nowait][,telnet] (unix)\n"
    "-chardev udp,id=id[,host=host],port=port[,localaddr=localaddr]\n"
    "         [,localport=localport][,ipv4][,ipv6]\n"
    "-chardev msmouse,id=id\n"
    "-chardev vc,id=id[[,width=width][,height=height]][[,cols=cols][,rows=rows]]\n"
    "-chardev file,id=id,path=path\n"
    "-chardev pipe,id=id,path=path\n"
#ifdef _WIN32
    "-chardev console,id=id\n"
    "-chardev serial,id=id,path=path\n"
#else
    "-chardev pty,id=id\n"
    "-chardev stdio,id=id\n"
#endif
#ifdef CONFIG_BRLAPI
    "-chardev braille,id=id\n"
#endif
#if defined(__linux__) || defined(__sun__) || defined(__FreeBSD__) \
        || defined(__NetBSD__) || defined(__OpenBSD__) || defined(__DragonFly__)
    "-chardev tty,id=id,path=path\n"
#endif
#if defined(__linux__) || defined(__FreeBSD__) || defined(__DragonFly__)
    "-chardev parport,id=id,path=path\n"
#endif
)

STEXI

The general form of a character device option is:
@table @option

@item -chardev @var{backend} ,id=@var{id} [,@var{options}]

Backend is one of:
@option{null},
@option{socket},
@option{udp},
@option{msmouse},
@option{vc},
@option{file},
@option{pipe},
@option{console},
@option{serial},
@option{pty},
@option{stdio},
@option{braille},
@option{tty},
@option{parport}.
The specific backend will determine the applicable options.

All devices must have an id, which can be any string up to 127 characters long.
It is used to uniquely identify this device in other command line directives.

Options to each backend are described below.

@item -chardev null ,id=@var{id}
A void device. This device will not emit any data, and will drop any data it
receives. The null backend does not take any options.

@item -chardev socket ,id=@var{id} [@var{TCP options} or @var{unix options}] [,server] [,nowait] [,telnet]

Create a two-way stream socket, which can be either a TCP or a unix socket. A
unix socket will be created if @option{path} is specified. Behaviour is
undefined if TCP options are specified for a unix socket.

@option{server} specifies that the socket shall be a listening socket.

@option{nowait} specifies that QEMU should not block waiting for a client to
connect to a listening socket.

@option{telnet} specifies that traffic on the socket should interpret telnet
escape sequences.

TCP and unix socket options are given below:

@table @option

@item TCP options: port=@var{host} [,host=@var{host}] [,to=@var{to}] [,ipv4] [,ipv6] [,nodelay]

@option{host} for a listening socket specifies the local address to be bound.
For a connecting socket species the remote host to connect to. @option{host} is
optional for listening sockets. If not specified it defaults to @code{0.0.0.0}.

@option{port} for a listening socket specifies the local port to be bound. For a
connecting socket specifies the port on the remote host to connect to.
@option{port} can be given as either a port number or a service name.
@option{port} is required.

@option{to} is only relevant to listening sockets. If it is specified, and
@option{port} cannot be bound, QEMU will attempt to bind to subsequent ports up
to and including @option{to} until it succeeds. @option{to} must be specified
as a port number.

@option{ipv4} and @option{ipv6} specify that either IPv4 or IPv6 must be used.
If neither is specified the socket may use either protocol.

@option{nodelay} disables the Nagle algorithm.

@item unix options: path=@var{path}

@option{path} specifies the local path of the unix socket. @option{path} is
required.

@end table

@item -chardev udp ,id=@var{id} [,host=@var{host}] ,port=@var{port} [,localaddr=@var{localaddr}] [,localport=@var{localport}] [,ipv4] [,ipv6]

Sends all traffic from the guest to a remote host over UDP.

@option{host} specifies the remote host to connect to. If not specified it
defaults to @code{localhost}.

@option{port} specifies the port on the remote host to connect to. @option{port}
is required.

@option{localaddr} specifies the local address to bind to. If not specified it
defaults to @code{0.0.0.0}.

@option{localport} specifies the local port to bind to. If not specified any
available local port will be used.

@option{ipv4} and @option{ipv6} specify that either IPv4 or IPv6 must be used.
If neither is specified the device may use either protocol.

@item -chardev msmouse ,id=@var{id}

Forward QEMU's emulated msmouse events to the guest. @option{msmouse} does not
take any options.

@item -chardev vc ,id=@var{id} [[,width=@var{width}] [,height=@var{height}]] [[,cols=@var{cols}] [,rows=@var{rows}]]

Connect to a QEMU text console. @option{vc} may optionally be given a specific
size.

@option{width} and @option{height} specify the width and height respectively of
the console, in pixels.

@option{cols} and @option{rows} specify that the console be sized to fit a text
console with the given dimensions.

@item -chardev file ,id=@var{id} ,path=@var{path}

Log all traffic received from the guest to a file.

@option{path} specifies the path of the file to be opened. This file will be
created if it does not already exist, and overwritten if it does. @option{path}
is required.

@item -chardev pipe ,id=@var{id} ,path=@var{path}

Create a two-way connection to the guest. The behaviour differs slightly between
Windows hosts and other hosts:

On Windows, a single duplex pipe will be created at
@file{\\.pipe\@option{path}}.

On other hosts, 2 pipes will be created called @file{@option{path}.in} and
@file{@option{path}.out}. Data written to @file{@option{path}.in} will be
received by the guest. Data written by the guest can be read from
@file{@option{path}.out}. QEMU will not create these fifos, and requires them to
be present.

@option{path} forms part of the pipe path as described above. @option{path} is
required.

@item -chardev console ,id=@var{id}

Send traffic from the guest to QEMU's standard output. @option{console} does not
take any options.

@option{console} is only available on Windows hosts.

@item -chardev serial ,id=@var{id} ,path=@option{path}

Send traffic from the guest to a serial device on the host.

@option{serial} is
only available on Windows hosts.

@option{path} specifies the name of the serial device to open.

@item -chardev pty ,id=@var{id}

Create a new pseudo-terminal on the host and connect to it. @option{pty} does
not take any options.

@option{pty} is not available on Windows hosts.

@item -chardev stdio ,id=@var{id}
Connect to standard input and standard output of the qemu process.
@option{stdio} does not take any options. @option{stdio} is not available on
Windows hosts.

@item -chardev braille ,id=@var{id}

Connect to a local BrlAPI server. @option{braille} does not take any options.

@item -chardev tty ,id=@var{id} ,path=@var{path}

Connect to a local tty device.

@option{tty} is only available on Linux, Sun, FreeBSD, NetBSD, OpenBSD and
DragonFlyBSD hosts.

@option{path} specifies the path to the tty. @option{path} is required.

@item -chardev parport ,id=@var{id} ,path=@var{path}

@option{parport} is only available on Linux, FreeBSD and DragonFlyBSD hosts.

Connect to a local parallel port.

@option{path} specifies the path to the parallel port device. @option{path} is
required.

@end table
ETEXI

DEFHEADING()

DEFHEADING(Bluetooth(R) options:)

DEF("bt", HAS_ARG, QEMU_OPTION_bt, \
    "-bt hci,null    dumb bluetooth HCI - doesn't respond to commands\n" \
    "-bt hci,host[:id]\n" \
    "                use host's HCI with the given name\n" \
    "-bt hci[,vlan=n]\n" \
    "                emulate a standard HCI in virtual scatternet 'n'\n" \
    "-bt vhci[,vlan=n]\n" \
    "                add host computer to virtual scatternet 'n' using VHCI\n" \
    "-bt device:dev[,vlan=n]\n" \
    "                emulate a bluetooth device 'dev' in scatternet 'n'\n")
STEXI
@table @option

@item -bt hci[...]
Defines the function of the corresponding Bluetooth HCI.  -bt options
are matched with the HCIs present in the chosen machine type.  For
example when emulating a machine with only one HCI built into it, only
the first @code{-bt hci[...]} option is valid and defines the HCI's
logic.  The Transport Layer is decided by the machine type.  Currently
the machines @code{n800} and @code{n810} have one HCI and all other
machines have none.

@anchor{bt-hcis}
The following three types are recognized:

@table @option
@item -bt hci,null
(default) The corresponding Bluetooth HCI assumes no internal logic
and will not respond to any HCI commands or emit events.

@item -bt hci,host[:@var{id}]
(@code{bluez} only) The corresponding HCI passes commands / events
to / from the physical HCI identified by the name @var{id} (default:
@code{hci0}) on the computer running QEMU.  Only available on @code{bluez}
capable systems like Linux.

@item -bt hci[,vlan=@var{n}]
Add a virtual, standard HCI that will participate in the Bluetooth
scatternet @var{n} (default @code{0}).  Similarly to @option{-net}
VLANs, devices inside a bluetooth network @var{n} can only communicate
with other devices in the same network (scatternet).
@end table

@item -bt vhci[,vlan=@var{n}]
(Linux-host only) Create a HCI in scatternet @var{n} (default 0) attached
to the host bluetooth stack instead of to the emulated target.  This
allows the host and target machines to participate in a common scatternet
and communicate.  Requires the Linux @code{vhci} driver installed.  Can
be used as following:

@example
qemu [...OPTIONS...] -bt hci,vlan=5 -bt vhci,vlan=5
@end example

@item -bt device:@var{dev}[,vlan=@var{n}]
Emulate a bluetooth device @var{dev} and place it in network @var{n}
(default @code{0}).  QEMU can only emulate one type of bluetooth devices
currently:

@table @option
@item keyboard
Virtual wireless keyboard implementing the HIDP bluetooth profile.
@end table
@end table
ETEXI

DEFHEADING()

DEFHEADING(Linux/Multiboot boot specific:)
STEXI

When using these options, you can use a given Linux or Multiboot
kernel without installing it in the disk image. It can be useful
for easier testing of various kernels.

@table @option
ETEXI

DEF("kernel", HAS_ARG, QEMU_OPTION_kernel, \
    "-kernel bzImage use 'bzImage' as kernel image\n")
STEXI
@item -kernel @var{bzImage}
Use @var{bzImage} as kernel image. The kernel can be either a Linux kernel
or in multiboot format.
ETEXI

DEF("append", HAS_ARG, QEMU_OPTION_append, \
    "-append cmdline use 'cmdline' as kernel command line\n")
STEXI
@item -append @var{cmdline}
Use @var{cmdline} as kernel command line
ETEXI

DEF("initrd", HAS_ARG, QEMU_OPTION_initrd, \
           "-initrd file    use 'file' as initial ram disk\n")
STEXI
@item -initrd @var{file}
Use @var{file} as initial ram disk.

@item -initrd "@var{file1} arg=foo,@var{file2}"

This syntax is only available with multiboot.

Use @var{file1} and @var{file2} as modules and pass arg=foo as parameter to the
first module.
ETEXI

STEXI
@end table
ETEXI

DEFHEADING()

DEFHEADING(Debug/Expert options:)

STEXI
@table @option
ETEXI

DEF("serial", HAS_ARG, QEMU_OPTION_serial, \
    "-serial dev     redirect the serial port to char device 'dev'\n")
STEXI
@item -serial @var{dev}
Redirect the virtual serial port to host character device
@var{dev}. The default device is @code{vc} in graphical mode and
@code{stdio} in non graphical mode.

This option can be used several times to simulate up to 4 serial
ports.

Use @code{-serial none} to disable all serial ports.

Available character devices are:
@table @option
@item vc[:@var{W}x@var{H}]
Virtual console. Optionally, a width and height can be given in pixel with
@example
vc:800x600
@end example
It is also possible to specify width or height in characters:
@example
vc:80Cx24C
@end example
@item pty
[Linux only] Pseudo TTY (a new PTY is automatically allocated)
@item none
No device is allocated.
@item null
void device
@item /dev/XXX
[Linux only] Use host tty, e.g. @file{/dev/ttyS0}. The host serial port
parameters are set according to the emulated ones.
@item /dev/parport@var{N}
[Linux only, parallel port only] Use host parallel port
@var{N}. Currently SPP and EPP parallel port features can be used.
@item file:@var{filename}
Write output to @var{filename}. No character can be read.
@item stdio
[Unix only] standard input/output
@item pipe:@var{filename}
name pipe @var{filename}
@item COM@var{n}
[Windows only] Use host serial port @var{n}
@item udp:[@var{remote_host}]:@var{remote_port}[@@[@var{src_ip}]:@var{src_port}]
This implements UDP Net Console.
When @var{remote_host} or @var{src_ip} are not specified
they default to @code{0.0.0.0}.
When not using a specified @var{src_port} a random port is automatically chosen.

If you just want a simple readonly console you can use @code{netcat} or
@code{nc}, by starting qemu with: @code{-serial udp::4555} and nc as:
@code{nc -u -l -p 4555}. Any time qemu writes something to that port it
will appear in the netconsole session.

If you plan to send characters back via netconsole or you want to stop
and start qemu a lot of times, you should have qemu use the same
source port each time by using something like @code{-serial
udp::4555@@:4556} to qemu. Another approach is to use a patched
version of netcat which can listen to a TCP port and send and receive
characters via udp.  If you have a patched version of netcat which
activates telnet remote echo and single char transfer, then you can
use the following options to step up a netcat redirector to allow
telnet on port 5555 to access the qemu port.
@table @code
@item Qemu Options:
-serial udp::4555@@:4556
@item netcat options:
-u -P 4555 -L 0.0.0.0:4556 -t -p 5555 -I -T
@item telnet options:
localhost 5555
@end table

@item tcp:[@var{host}]:@var{port}[,@var{server}][,nowait][,nodelay]
The TCP Net Console has two modes of operation.  It can send the serial
I/O to a location or wait for a connection from a location.  By default
the TCP Net Console is sent to @var{host} at the @var{port}.  If you use
the @var{server} option QEMU will wait for a client socket application
to connect to the port before continuing, unless the @code{nowait}
option was specified.  The @code{nodelay} option disables the Nagle buffering
algorithm.  If @var{host} is omitted, 0.0.0.0 is assumed. Only
one TCP connection at a time is accepted. You can use @code{telnet} to
connect to the corresponding character device.
@table @code
@item Example to send tcp console to 192.168.0.2 port 4444
-serial tcp:192.168.0.2:4444
@item Example to listen and wait on port 4444 for connection
-serial tcp::4444,server
@item Example to not wait and listen on ip 192.168.0.100 port 4444
-serial tcp:192.168.0.100:4444,server,nowait
@end table

@item telnet:@var{host}:@var{port}[,server][,nowait][,nodelay]
The telnet protocol is used instead of raw tcp sockets.  The options
work the same as if you had specified @code{-serial tcp}.  The
difference is that the port acts like a telnet server or client using
telnet option negotiation.  This will also allow you to send the
MAGIC_SYSRQ sequence if you use a telnet that supports sending the break
sequence.  Typically in unix telnet you do it with Control-] and then
type "send break" followed by pressing the enter key.

@item unix:@var{path}[,server][,nowait]
A unix domain socket is used instead of a tcp socket.  The option works the
same as if you had specified @code{-serial tcp} except the unix domain socket
@var{path} is used for connections.

@item mon:@var{dev_string}
This is a special option to allow the monitor to be multiplexed onto
another serial port.  The monitor is accessed with key sequence of
@key{Control-a} and then pressing @key{c}. See monitor access
@ref{pcsys_keys} in the -nographic section for more keys.
@var{dev_string} should be any one of the serial devices specified
above.  An example to multiplex the monitor onto a telnet server
listening on port 4444 would be:
@table @code
@item -serial mon:telnet::4444,server,nowait
@end table

@item braille
Braille device.  This will use BrlAPI to display the braille output on a real
or fake device.

@item msmouse
Three button serial mouse. Configure the guest to use Microsoft protocol.
@end table
ETEXI

DEF("parallel", HAS_ARG, QEMU_OPTION_parallel, \
    "-parallel dev   redirect the parallel port to char device 'dev'\n")
STEXI
@item -parallel @var{dev}
Redirect the virtual parallel port to host device @var{dev} (same
devices as the serial port). On Linux hosts, @file{/dev/parportN} can
be used to use hardware devices connected on the corresponding host
parallel port.

This option can be used several times to simulate up to 3 parallel
ports.

Use @code{-parallel none} to disable all parallel ports.
ETEXI

DEF("monitor", HAS_ARG, QEMU_OPTION_monitor, \
    "-monitor [control,]dev    redirect the monitor to char device 'dev'\n")
STEXI
@item -monitor [@var{control},]@var{dev}
Redirect the monitor to host device @var{dev} (same devices as the
serial port).
The default device is @code{vc} in graphical mode and @code{stdio} in
non graphical mode.
The option @var{control} enables the QEMU Monitor Protocol.
ETEXI

DEF("pidfile", HAS_ARG, QEMU_OPTION_pidfile, \
    "-pidfile file   write PID to 'file'\n")
STEXI
@item -pidfile @var{file}
Store the QEMU process PID in @var{file}. It is useful if you launch QEMU
from a script.
ETEXI

DEF("singlestep", 0, QEMU_OPTION_singlestep, \
    "-singlestep   always run in singlestep mode\n")
STEXI
@item -singlestep
Run the emulation in single step mode.
ETEXI

DEF("S", 0, QEMU_OPTION_S, \
    "-S              freeze CPU at startup (use 'c' to start execution)\n")
STEXI
@item -S
Do not start CPU at startup (you must type 'c' in the monitor).
ETEXI

DEF("gdb", HAS_ARG, QEMU_OPTION_gdb, \
    "-gdb dev        wait for gdb connection on 'dev'\n")
STEXI
@item -gdb @var{dev}
Wait for gdb connection on device @var{dev} (@pxref{gdb_usage}). Typical
connections will likely be TCP-based, but also UDP, pseudo TTY, or even
stdio are reasonable use case. The latter is allowing to start qemu from
within gdb and establish the connection via a pipe:
@example
(gdb) target remote | exec qemu -gdb stdio ...
@end example
ETEXI

DEF("s", 0, QEMU_OPTION_s, \
    "-s              shorthand for -gdb tcp::%s\n")
STEXI
@item -s
Shorthand for -gdb tcp::1234, i.e. open a gdbserver on TCP port 1234
(@pxref{gdb_usage}).
ETEXI

DEF("d", HAS_ARG, QEMU_OPTION_d, \
    "-d item1,...    output log to %s (use -d ? for a list of log items)\n")
STEXI
@item -d
Output log in /tmp/qemu.log
ETEXI

DEF("hdachs", HAS_ARG, QEMU_OPTION_hdachs, \
    "-hdachs c,h,s[,t]\n" \
    "                force hard disk 0 physical geometry and the optional BIOS\n" \
    "                translation (t=none or lba) (usually qemu can guess them)\n")
STEXI
@item -hdachs @var{c},@var{h},@var{s},[,@var{t}]
Force hard disk 0 physical geometry (1 <= @var{c} <= 16383, 1 <=
@var{h} <= 16, 1 <= @var{s} <= 63) and optionally force the BIOS
translation mode (@var{t}=none, lba or auto). Usually QEMU can guess
all those parameters. This option is useful for old MS-DOS disk
images.
ETEXI

DEF("L", HAS_ARG, QEMU_OPTION_L, \
    "-L path         set the directory for the BIOS, VGA BIOS and keymaps\n")
STEXI
@item -L  @var{path}
Set the directory for the BIOS, VGA BIOS and keymaps.
ETEXI

DEF("bios", HAS_ARG, QEMU_OPTION_bios, \
    "-bios file      set the filename for the BIOS\n")
STEXI
@item -bios @var{file}
Set the filename for the BIOS.
ETEXI

#ifdef CONFIG_KVM
DEF("enable-kvm", 0, QEMU_OPTION_enable_kvm, \
    "-enable-kvm     enable KVM full virtualization support\n")
#endif
STEXI
@item -enable-kvm
Enable KVM full virtualization support. This option is only available
if KVM support is enabled when compiling.
ETEXI

#ifdef CONFIG_XEN
DEF("xen-domid", HAS_ARG, QEMU_OPTION_xen_domid,
    "-xen-domid id   specify xen guest domain id\n")
DEF("xen-create", 0, QEMU_OPTION_xen_create,
    "-xen-create     create domain using xen hypercalls, bypassing xend\n"
    "                warning: should not be used when xend is in use\n")
DEF("xen-attach", 0, QEMU_OPTION_xen_attach,
    "-xen-attach     attach to existing xen domain\n"
    "                xend will use this when starting qemu\n")
#endif

DEF("no-reboot", 0, QEMU_OPTION_no_reboot, \
    "-no-reboot      exit instead of rebooting\n")
STEXI
@item -no-reboot
Exit instead of rebooting.
ETEXI

DEF("no-shutdown", 0, QEMU_OPTION_no_shutdown, \
    "-no-shutdown    stop before shutdown\n")
STEXI
@item -no-shutdown
Don't exit QEMU on guest shutdown, but instead only stop the emulation.
This allows for instance switching to monitor to commit changes to the
disk image.
ETEXI

DEF("loadvm", HAS_ARG, QEMU_OPTION_loadvm, \
    "-loadvm [tag|id]\n" \
    "                start right away with a saved state (loadvm in monitor)\n")
STEXI
@item -loadvm @var{file}
Start right away with a saved state (@code{loadvm} in monitor)
ETEXI

#ifndef _WIN32
DEF("daemonize", 0, QEMU_OPTION_daemonize, \
    "-daemonize      daemonize QEMU after initializing\n")
#endif
STEXI
@item -daemonize
Daemonize the QEMU process after initialization.  QEMU will not detach from
standard IO until it is ready to receive connections on any of its devices.
This option is a useful way for external programs to launch QEMU without having
to cope with initialization race conditions.
ETEXI

DEF("option-rom", HAS_ARG, QEMU_OPTION_option_rom, \
    "-option-rom rom load a file, rom, into the option ROM space\n")
STEXI
@item -option-rom @var{file}
Load the contents of @var{file} as an option ROM.
This option is useful to load things like EtherBoot.
ETEXI

DEF("clock", HAS_ARG, QEMU_OPTION_clock, \
    "-clock          force the use of the given methods for timer alarm.\n" \
    "                To see what timers are available use -clock ?\n")
STEXI
@item -clock @var{method}
Force the use of the given methods for timer alarm. To see what timers
are available use -clock ?.
ETEXI

HXCOMM Options deprecated by -rtc
DEF("localtime", 0, QEMU_OPTION_localtime, "")
DEF("startdate", HAS_ARG, QEMU_OPTION_startdate, "")

#ifdef TARGET_I386
DEF("rtc", HAS_ARG, QEMU_OPTION_rtc, \
    "-rtc [base=utc|localtime|date][,clock=host|vm][,driftfix=none|slew]\n" \
    "                set the RTC base and clock, enable drift fix for clock ticks\n")
#else
DEF("rtc", HAS_ARG, QEMU_OPTION_rtc, \
    "-rtc [base=utc|localtime|date][,clock=host|vm]\n" \
    "                set the RTC base and clock\n")
#endif

STEXI

@item -rtc [base=utc|localtime|@var{date}][,clock=host|vm][,driftfix=none|slew]
Specify @option{base} as @code{utc} or @code{localtime} to let the RTC start at the current
UTC or local time, respectively. @code{localtime} is required for correct date in
MS-DOS or Windows. To start at a specific point in time, provide @var{date} in the
format @code{2006-06-17T16:01:21} or @code{2006-06-17}. The default base is UTC.

By default the RTC is driven by the host system time. This allows to use the
RTC as accurate reference clock inside the guest, specifically if the host
time is smoothly following an accurate external reference clock, e.g. via NTP.
If you want to isolate the guest time from the host, even prevent it from
progressing during suspension, you can set @option{clock} to @code{vm} instead.

Enable @option{driftfix} (i386 targets only) if you experience time drift problems,
specifically with Windows' ACPI HAL. This option will try to figure out how
many timer interrupts were not processed by the Windows guest and will
re-inject them.
ETEXI

DEF("icount", HAS_ARG, QEMU_OPTION_icount, \
    "-icount [N|auto]\n" \
    "                enable virtual instruction counter with 2^N clock ticks per\n" \
    "                instruction\n")
STEXI
@item -icount [@var{N}|auto]
Enable virtual instruction counter.  The virtual cpu will execute one
instruction every 2^@var{N} ns of virtual time.  If @code{auto} is specified
then the virtual cpu speed will be automatically adjusted to keep virtual
time within a few seconds of real time.

Note that while this option can give deterministic behavior, it does not
provide cycle accurate emulation.  Modern CPUs contain superscalar out of
order cores with complex cache hierarchies.  The number of instructions
executed often has little or no correlation with actual performance.
ETEXI

DEF("watchdog", HAS_ARG, QEMU_OPTION_watchdog, \
    "-watchdog i6300esb|ib700\n" \
    "                enable virtual hardware watchdog [default=none]\n")
STEXI
@item -watchdog @var{model}
Create a virtual hardware watchdog device.  Once enabled (by a guest
action), the watchdog must be periodically polled by an agent inside
the guest or else the guest will be restarted.

The @var{model} is the model of hardware watchdog to emulate.  Choices
for model are: @code{ib700} (iBASE 700) which is a very simple ISA
watchdog with a single timer, or @code{i6300esb} (Intel 6300ESB I/O
controller hub) which is a much more featureful PCI-based dual-timer
watchdog.  Choose a model for which your guest has drivers.

Use @code{-watchdog ?} to list available hardware models.  Only one
watchdog can be enabled for a guest.
ETEXI

DEF("watchdog-action", HAS_ARG, QEMU_OPTION_watchdog_action, \
    "-watchdog-action reset|shutdown|poweroff|pause|debug|none\n" \
    "                action when watchdog fires [default=reset]\n")
STEXI
@item -watchdog-action @var{action}

The @var{action} controls what QEMU will do when the watchdog timer
expires.
The default is
@code{reset} (forcefully reset the guest).
Other possible actions are:
@code{shutdown} (attempt to gracefully shutdown the guest),
@code{poweroff} (forcefully poweroff the guest),
@code{pause} (pause the guest),
@code{debug} (print a debug message and continue), or
@code{none} (do nothing).

Note that the @code{shutdown} action requires that the guest responds
to ACPI signals, which it may not be able to do in the sort of
situations where the watchdog would have expired, and thus
@code{-watchdog-action shutdown} is not recommended for production use.

Examples:

@table @code
@item -watchdog i6300esb -watchdog-action pause
@item -watchdog ib700
@end table
ETEXI

DEF("echr", HAS_ARG, QEMU_OPTION_echr, \
    "-echr chr       set terminal escape character instead of ctrl-a\n")
STEXI

@item -echr @var{numeric_ascii_value}
Change the escape character used for switching to the monitor when using
monitor and serial sharing.  The default is @code{0x01} when using the
@code{-nographic} option.  @code{0x01} is equal to pressing
@code{Control-a}.  You can select a different character from the ascii
control keys where 1 through 26 map to Control-a through Control-z.  For
instance you could use the either of the following to change the escape
character to Control-t.
@table @code
@item -echr 0x14
@item -echr 20
@end table
ETEXI

DEF("virtioconsole", HAS_ARG, QEMU_OPTION_virtiocon, \
    "-virtioconsole c\n" \
    "                set virtio console\n")
STEXI
@item -virtioconsole @var{c}
Set virtio console.
ETEXI

DEF("show-cursor", 0, QEMU_OPTION_show_cursor, \
    "-show-cursor    show cursor\n")
STEXI
ETEXI

DEF("tb-size", HAS_ARG, QEMU_OPTION_tb_size, \
    "-tb-size n      set TB size\n")
STEXI
ETEXI

DEF("incoming", HAS_ARG, QEMU_OPTION_incoming, \
    "-incoming p     prepare for incoming migration, listen on port p\n")
STEXI
ETEXI

#ifndef _WIN32
DEF("chroot", HAS_ARG, QEMU_OPTION_chroot, \
    "-chroot dir     Chroot to dir just before starting the VM.\n")
#endif
STEXI
@item -chroot @var{dir}
Immediately before starting guest execution, chroot to the specified
directory.  Especially useful in combination with -runas.
ETEXI

#ifndef _WIN32
DEF("runas", HAS_ARG, QEMU_OPTION_runas, \
    "-runas user     Change to user id user just before starting the VM.\n")
#endif
STEXI
@item -runas @var{user}
Immediately before starting guest execution, drop root privileges, switching
to the specified user.
ETEXI

STEXI
@end table
ETEXI

#if defined(TARGET_SPARC) || defined(TARGET_PPC)
DEF("prom-env", HAS_ARG, QEMU_OPTION_prom_env,
    "-prom-env variable=value\n"
    "                set OpenBIOS nvram variables\n")
#endif
#if defined(TARGET_ARM) || defined(TARGET_M68K)
DEF("semihosting", 0, QEMU_OPTION_semihosting,
    "-semihosting    semihosting mode\n")
#endif
#if defined(TARGET_ARM)
DEF("old-param", 0, QEMU_OPTION_old_param,
    "-old-param      old param mode\n")
#endif
DEF("readconfig", HAS_ARG, QEMU_OPTION_readconfig,
    "-readconfig <file>\n")
DEF("writeconfig", HAS_ARG, QEMU_OPTION_writeconfig,
    "-writeconfig <file>\n"
    "                read/write config file")
