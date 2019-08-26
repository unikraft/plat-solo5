/* SPDX-License-Identifier: ISC */
/*
 * Authors: Haibo Xu <haibo.xu@arm.com>
 *
 * Copyright (c) 2018, Arm Ltd. All rights reserved.
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

#include <uk/assert.h>
#include <uk/plat/bootstrap.h>
#include <solo5/setup.h>
#include <solo5/solo5.h>

#define MAX_CMDLINE_SIZE 8192

struct libsolo5plat_opts _libsolo5plat_opts = { 0 };

int solo5_app_main(const struct solo5_start_info *si) {
	UK_ASSERT(si != __NULL);

	uk_pr_info("Entering from SOLO5...\n");

	_libsolo5plat_opts.heap.len  = si->heap_size;
	_libsolo5plat_opts.heap.base = (void*)(si->heap_start);

	ukplat_entry_argp(__NULL, si->cmdline, MAX_CMDLINE_SIZE);

	return SOLO5_EXIT_SUCCESS;
}
