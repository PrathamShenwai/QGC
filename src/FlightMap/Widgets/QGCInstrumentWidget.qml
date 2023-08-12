/****************************************************************************
 *
 * (c) 2009-2020 QGROUNDCONTROL PROJECT <http://www.qgroundcontrol.org>
 *
 * QGroundControl is licensed according to the terms in the file
 * COPYING.md in the root of the source code directory.
 *
 ****************************************************************************/

import QtQuick          2.12
import QtQuick.Layouts  1.12

import QGroundControl               1.0
import QGroundControl.Controls      1.0
import QGroundControl.ScreenTools   1.0
import QGroundControl.FactSystem    1.0
import QGroundControl.FlightMap     1.0
import QGroundControl.FlightDisplay 1.0
import QGroundControl.Palette       1.0

ColumnLayout {
    id:         root
    spacing:    ScreenTools.defaultFontPixelHeight / 4

    property real   _innerRadius:           (width - (_topBottomMargin * 3)) / 4
    property real   _outerRadius:           _innerRadius + _topBottomMargin
    property real   _spacing:               ScreenTools.defaultFontPixelHeight * 0.33
    property real   _topBottomMargin:       (width * 0.05) / 2

    QGCPalette { id: qgcPal }

    Rectangle {
        id:                 visualInstrument
        //height:             _outerRadius * 2
        //Layout.fillWidth:   false
        //radius:             _outerRadius
        //color:              qgcPal.window

        DeadMouseArea { anchors.fill: parent }

        // Add these properties at the beginning of your QML file or inside a relevant item.
        property int moveOffset: 0
        property int widgetSpacing: 2 // Adjust this value as needed

        QGCAttitudeWidget {
            id: attitude
            anchors.left: parent.left     // Align the left side of the attitude widget with the left side of its parent
            anchors.verticalCenter: parent.verticalCenter - 50  // Move the widget upwards by 50 units from the vertical center
            size: _innerRadius * 1.5
            vehicle: globals.activeVehicle
        }

        QGCCompassWidget {
            id: compass
            anchors.left: attitude.left   // Align the left side of the compass with the left side of the attitude widget
            anchors.top: attitude.bottom  // Place the compass widget below the attitude widget
            anchors.topMargin: 10         // Set a margin of 10 units between the attitude widget and compass
            size: _innerRadius * 1.5
            vehicle: globals.activeVehicle
        }

    }

    TerrainProgress {
        Layout.fillWidth: true
    }
}
