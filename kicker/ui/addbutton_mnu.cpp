/*****************************************************************

Copyright (c) 1996-2000 the kicker authors. See file AUTHORS.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL THE
AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN
AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

******************************************************************/

#include <qdragobject.h>

#include <ksycocaentry.h>
#include <kservice.h>
#include <kservicegroup.h>
#include <kstddirs.h>
#include <kdebug.h>

#include "addbutton_mnu.h"
#include "addbutton_mnu.moc"
#include "containerarea.h"

PanelAddButtonMenu::PanelAddButtonMenu(ContainerArea* cArea, const QString & label,
				       const QString & relPath, QWidget * parent, const char * name)
    : PanelServiceMenu(label, relPath, parent, name, true), containerArea(cArea)
{
}

PanelAddButtonMenu::PanelAddButtonMenu(ContainerArea* cArea, QWidget * parent, const char * name)
    : PanelServiceMenu(QString::null, QString::null, parent, name, true), containerArea(cArea)
{
}

void PanelAddButtonMenu::slotExec(int id)
{
    if (!entryMap_.contains(id))
	return;

    KSycocaEntry * e = entryMap_[id];

    if (e->isType(KST_KServiceGroup)) {
	KServiceGroup::Ptr g = static_cast<KServiceGroup *>(e);
	containerArea->addServiceMenuButton(g->name(), g->relPath());
    }
    else {	
	KService::Ptr service = static_cast<KService *>(e);
	containerArea->addURLButton(locate("apps", service->desktopEntryPath()));
    }
}

PanelServiceMenu * PanelAddButtonMenu::newSubMenu(const QString & label, const QString & relPath,
						QWidget * parent, const char * name)
{
    return new PanelAddButtonMenu(containerArea, label, relPath, parent, name);
}

