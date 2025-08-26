(define (domain connect-wii-hdtv)
  (:requirements :strips :typing)
  (:types
    hdmi_cord wii_av_output cord tv converter)

  (:predicates
    (plugged_in_hdmi_cord ?h - hdmi_cord)
    (connected_to_cable ?h - hdmi_cord)
    (connected_to_tv ?h - hdmi_cord)
    (connected_to_wii ?h - hdmi_cord)
    (connected_to_converter_tv ?h - hdmi_cord)
    (full_av_output ?w - wii_av_output)
    (full_tv ?t - tv)
    (connected_converter ?c - converter)
  )

  (:action plug_hdmi_to_cable
    :parameters (?h - hdmi_cord)
    :precondition (and (not (connected_to_cable ?h)))
    :effect (and (connected_to_cable ?h)))

  (:action plug_hdmi_to_tv
    :parameters (?h - hdmi_cord ?t - tv)
    :precondition (and (connected_to_cable ?h) (not (connected_to_tv ?h)))
    :effect (and (connected_to_tv ?h) (full_tv ?t)))

  (:action connect_hdmi_to_wii_av
    :parameters (?h - hdmi_cord ?w - wii_av_output)
    :precondition (and (connected_to_tv ?h) (not (connected_to_wii ?h)))
    :effect (and (connected_to_wii ?h) (full_av_output ?w)))

  (:action plug_hdmi_to_converter
    :parameters (?h - hdmi_cord ?c - converter ?t - tv)
    :precondition (and (connected_to_wii ?h) (not (connected_to_converter_tv ?h)))
    :effect (and (connected_to_converter_tv ?h) (connected_converter ?c)))
)