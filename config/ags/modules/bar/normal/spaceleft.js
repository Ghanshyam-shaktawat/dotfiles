import App from "resource:///com/github/Aylur/ags/app.js";
import Widget from "resource:///com/github/Aylur/ags/widget.js";
import Brightness from "../../../services/brightness.js";
import Indicator from "../../../services/indicator.js";

const WindowTitle = async () => {
  return Widget.Scrollable({
    hexpand: true,
    vexpand: true,
    hscroll: "automatic",
    vscroll: "never",
    child: Widget.Box({
      vertical: false,
      children: [
        Widget.Label({
          xalign: 0,
          truncate: "end",
          maxWidthChars: 10, // Doesn't matter, just needs to be non negative
          className: "bar-arch-icon",
          label: "",
        }),
      ],
    }),
  });
};

export default async (monitor = 0) => {
  const optionalWindowTitleInstance = await WindowTitle();
  return Widget.EventBox({
    onScrollUp: () => {
      Indicator.popup(1); // Since the brightness and speaker are both on the same window
      Brightness[monitor].screen_value += 0.05;
    },
    onScrollDown: () => {
      Indicator.popup(1); // Since the brightness and speaker are both on the same window
      if (Brightness[monitor].screen_value <= 0.1)
        Brightness[monitor].screen_value = 0.05;
      else Brightness[monitor].screen_value -= 0.05;
    },
    onPrimaryClick: () => {
      App.toggleWindow("sideleft");
    },
    child: Widget.Box({
      homogeneous: false,
      children: [
        Widget.Box({ className: "bar-corner-spacing" }),
        Widget.Overlay({
          overlays: [
            Widget.Box({ hexpand: true }),
            Widget.Box({
              className: "bar-sidemodule",
              hexpand: true,
              children: [
                Widget.Box({
                  vertical: true,
                  className: "bar-space-button",
                  children: [optionalWindowTitleInstance],
                }),
              ],
            }),
          ],
        }),
      ],
    }),
  });
};
