/*
 *  Copyright (c) 2000 Kurt Granroth <granroth@kde.org>
 *  Copyright (c) 2000 Matthias Elter <elter@kde.org>
 *
 *  This program is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation; either version 2 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program; if not, write to the Free Software
 */

#ifndef __kcmtaskbar_h__
#define __kcmtaskbar_h__

#include <kcmodule.h>
#include <kcmtaskbarui.h>

class QCheckBox;
class QButtonGroup;

class TaskbarConfig : public KCModule
{
    Q_OBJECT

public:
    TaskbarConfig( QWidget *parent=0, const char* name=0 );
    virtual ~TaskbarConfig();

    void load();
    void save();
    void defaults();

    QString quickHelp() const;

protected slots:
    void configChanged();

private:
    TaskbarConfigUI *ui;
};

#endif
