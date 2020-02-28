/* SPDX-License-Identifier: ISC */
/*
 * Author(s): Dan Williams <djwillia@us.ibm.com>
 *            Martin Lucina <martin.lucina@docker.com>
 *            Simon Kuenzer <simon.kuenzer@neclab.eu>
 *            Haibo Xu <haibo.xu@arm.com>
 *
 * Copyright (c) 2016, IBM
 *           (c) 2016-2017 Docker, Inc.
 *           (c) 2017, NEC Europe Ltd.
 *           (c) 2018, Arm Ltd. All rights reserved.
 *
 * Permission to use, copy, modify, and/or distribute this software
 * for any purpose with or without fee is hereby granted, provided
 * that the above copyright notice and this permission notice appear
 * in all copies.
 *
 * THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL
 * WARRANTIES WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED
 * WARRANTIES OF MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE
 * AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT, INDIRECT, OR
 * CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS
 * OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT,
 * NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF OR IN
 * CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
 */

ENTRY(_start)

SECTIONS {
    . = 0x100000;

    /* Code */
    _stext = .;

    .text :
    {
        *(.text)
        *(.text.*)
    }

    _etext = .;

    . = ALIGN(0x1000);
    __eh_frame_start = .;
    .eh_frame :
    {
            *(.eh_frame)
            *(.eh_frame.*)
    }
    __eh_frame_end = .;

    __eh_frame_hdr_start = .;
    .eh_frame_hdr :
    {
            *(.eh_frame_hdr)
            *(.eh_frame_hdr.*)
    }
    __eh_frame_hdr_end = .;

    . = ALIGN(0x1000);
    uk_ctortab_start = .;
    .uk_ctortab :
    {
            KEEP(*(SORT_BY_NAME(.uk_ctortab[0-7])))
    }
    uk_ctortab_end = .;

	uk_inittab_start = .;
	.uk_inittab :
	{
		KEEP(*(SORT_BY_NAME(.uk_inittab_[1-6][0-9])))
	}
	uk_inittab_end = .;

    . = ALIGN(0x1000);
    /* Read-only data */
    .rodata :
    {
        *(.rodata)
        *(.rodata.*)
    }

    _erodata = .;

    /* Constructor tables (read-only) */
    . = ALIGN(0x8);
    _ctors = .;
    .preinit_array : {
	    PROVIDE_HIDDEN (__preinit_array_start = .);
	    KEEP (*(.preinit_array))
		    PROVIDE_HIDDEN (__preinit_array_end = .);
    }

    . = ALIGN(0x8);
    .init_array : {
	    PROVIDE_HIDDEN (__init_array_start = .);
	    KEEP (*(SORT_BY_INIT_PRIORITY(.init_array.*) SORT_BY_INIT_PRIORITY(.ctors.*)))
		    KEEP (*(.init_array .ctors))
		    PROVIDE_HIDDEN (__init_array_end = .);
    }
    _ectors = .;

    . = ALIGN(0x1000);
    /* Read-write data (initialized) */
    .data :
    {
        *(.data)
        *(.data.*)
    }

    _edata = .;

    . = ALIGN(0x1000);
    /* Read-write data (uninitialized) */
    .bss :
    {
        *(.bss)
        *(.bss.*)
        *(COMMON)
    }

    . = ALIGN(0x1000);
    _ebss = .;
    _end = .;
}
