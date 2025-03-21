/*
 * QError header file.
 *
 * Copyright (C) 2009 Red Hat Inc.
 *
 * Authors:
 *  Luiz Capitulino <lcapitulino@redhat.com>
 *
 * This work is licensed under the terms of the GNU LGPL, version 2.1 or later.
 * See the COPYING.LIB file in the top-level directory.
 */
#ifndef QERROR_H
#define QERROR_H

#include "qdict.h"
#include <stdarg.h>

typedef struct QErrorStringTable {
    const char *desc;
    const char *error_fmt;
} QErrorStringTable;

typedef struct QError {
    QObject_HEAD;
    QDict *error;
    int linenr;
    const char *file;
    const char *func;
    const QErrorStringTable *entry;
} QError;

QError *qerror_new(void);
QError *qerror_from_info(const char *file, int linenr, const char *func,
                         const char *fmt, va_list *va);
void qerror_print(const QError *qerror);
QError *qobject_to_qerror(const QObject *obj);

/*
 * QError class list
 */
#define QERR_COMMAND_NOT_FOUND \
        "{ 'class': 'CommandNotFound', 'data': { 'name': %s } }"

#define QERR_DEVICE_NOT_FOUND \
        "{ 'class': 'DeviceNotFound', 'data': { 'device': %s } }"

#define QERR_DEVICE_NOT_ACTIVE \
        "{ 'class': 'DeviceNotActive', 'data': { 'device': %s } }"

#define QERR_INVALID_PARAMETER_TYPE \
        "{ 'class': 'InvalidParameterType', 'data': { 'name': %s,'expected': %s } }"

#define QERR_KVM_MISSING_CAP \
        "{ 'class': 'KVMMissingCap', 'data': { 'capability': %s, 'feature': %s } }"

#define QERR_MISSING_PARAMETER \
        "{ 'class': 'MissingParameter', 'data': { 'name': %s } }"

#define QERR_QMP_BAD_INPUT_OBJECT \
        "{ 'class': 'QMPBadInputObject', 'data': { 'expected': %s } }"

#define QERR_JSON_PARSING \
        "{ 'class': 'JSONParsing', 'data': {} }"

#define QERR_UNDEFINED_ERROR \
        "{ 'class': 'UndefinedError', 'data': {} }"

#endif /* QERROR_H */
