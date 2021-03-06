/*
  'Web' kwin client

  Copyright (C) 2001 Rik Hemsley (rikkus) <rik@kde.org>

  This program is free software; you can redistribute it and/or
  modify it under the terms of the GNU General Public
  License as published by the Free Software Foundation; either
  version 2 of the License, or (at your option) any later version.

  This program is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
  General Public License for more details.

  You should have received a copy of the GNU General Public License
  along with this program; see the file COPYING.  If not, write to
  the Free Software Foundation, Inc., 59 Temple Place - Suite 330,
  Boston, MA 02111-1307, USA.
*/

#ifndef KWIN_WEB_BUTTON_MAXIMIZE_H
#define KWIN_WEB_BUTTON_MAXIMIZE_H

#include "WebButton.h"

namespace KWinInternal
{

  class WebButtonMaximize : public WebButton
  {
    Q_OBJECT

    public:

      WebButtonMaximize(bool maximised, QWidget * parent);

    protected:

      virtual void clickEvent(int button);

    protected slots:

      void slotMaximizeChange(bool);

    signals:

      void maximize(int mode);
  };
}

#endif
// vim:ts=2:sw=2:tw=78:set et:
