import App from "resource:///com/github/Aylur/ags/app.js";
import Widget from "resource:///com/github/Aylur/ags/widget.js";
import * as Utils from "resource:///com/github/Aylur/ags/utils.js";

import Audio from "resource:///com/github/Aylur/ags/service/audio.js";
import SystemTray from "resource:///com/github/Aylur/ags/service/systemtray.js";
const { execAsync } = Utils;
import Indicator from "../../../services/indicator.js";
import { StatusIcons } from "../../.commonwidgets/statusicons.js";
import { Tray } from "./tray.js";
const { GLib } = imports.gi;

const SeparatorDot = () =>
  Widget.Revealer({
    transition: "slide_left",
    revealChild: false,
    attribute: {
      count: SystemTray.items.length,
      update: (self, diff) => {
        self.attribute.count += diff;
        self.revealChild = self.attribute.count > 0;
      },
    },
    child: Widget.Box({
      vpack: "center",
      className: "separator-circle",
    }),
    setup: (self) =>
      self
        .hook(SystemTray, (self) => self.attribute.update(self, 1), "added")
        .hook(SystemTray, (self) => self.attribute.update(self, -1), "removed"),
  });

const BarClock = (props = {}) =>
  Widget.Box({
    ...props,
    vpack: "center",
    className: "bar-statusicons spacing-h-4 bar-clock-box",
    children: [
      Widget.Label({
        className: "bar-time",
        label: GLib.DateTime.new_now_local().format(userOptions.time.format),
        setup: (self) =>
          self.poll(userOptions.time.interval, (label) => {
            label.label = GLib.DateTime.new_now_local().format(
              userOptions.time.format,
            );
          }),
      }),
      Widget.Label({
        className: "txt-norm txt-onLayer1",
        label: "•",
      }),
      Widget.Label({
        className: "txt-smallie bar-date",
        label: GLib.DateTime.new_now_local().format(
          userOptions.time.dateFormatLong,
        ),
        setup: (self) =>
          self.poll(userOptions.time.dateInterval, (label) => {
            label.label = GLib.DateTime.new_now_local().format(
              userOptions.time.dateFormatLong,
            );
          }),
      }),
    ],
  });

export default () => {
  const barTray = Tray();
  const barClock = BarClock();
  const barStatusIcons = StatusIcons({
    className: "bar-statusicons",
    setup: (self) =>
      self.hook(App, (self, currentName, visible) => {
        if (currentName === "sideright") {
          self.toggleClassName("bar-statusicons-active", visible);
        }
      }),
  });
  const SpaceRightDefaultClicks = (child) =>
    Widget.EventBox({
      onHover: () => {
        barStatusIcons.toggleClassName("bar-statusicons-hover", true);
      },
      onHoverLost: () => {
        barStatusIcons.toggleClassName("bar-statusicons-hover", false);
      },
      onPrimaryClick: () => App.toggleWindow("sideright"),
      onSecondaryClick: () =>
        execAsync([
          "bash",
          "-c",
          'playerctl next || playerctl position `bc <<< "100 * $(playerctl metadata mpris:length) / 1000000 / 100"` &',
        ]).catch(print),
      onMiddleClick: () => execAsync("playerctl play-pause").catch(print),
      setup: (self) =>
        self.on("button-press-event", (self, event) => {
          if (event.get_button()[1] === 8)
            execAsync("playerctl previous").catch(print);
        }),
      child: child,
    });
  const emptyArea = SpaceRightDefaultClicks(Widget.Box({ hexpand: true }));
  const indicatorArea = SpaceRightDefaultClicks(
    Widget.Box({
      children: [SeparatorDot(), barClock, barStatusIcons],
    }),
  );
  const actualContent = Widget.Box({
    hexpand: true,
    className: "spacing-h-5 bar-spaceright",
    children: [emptyArea, barTray, indicatorArea],
  });

  return Widget.EventBox({
    onScrollUp: () => {
      if (!Audio.speaker) return;
      if (Audio.speaker.volume <= 0.09) Audio.speaker.volume += 0.01;
      else Audio.speaker.volume += 0.03;
      Indicator.popup(1);
    },
    onScrollDown: () => {
      if (!Audio.speaker) return;
      if (Audio.speaker.volume <= 0.09) Audio.speaker.volume -= 0.01;
      else Audio.speaker.volume -= 0.03;
      Indicator.popup(1);
    },
    child: Widget.Box({
      children: [
        actualContent,
        SpaceRightDefaultClicks(
          Widget.Box({ className: "bar-corner-spacing" }),
        ),
      ],
    }),
  });
};

