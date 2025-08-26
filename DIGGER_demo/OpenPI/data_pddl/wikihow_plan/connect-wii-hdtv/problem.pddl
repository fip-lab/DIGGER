(define (problem connect-wii-hdtv-instance)
  (:domain connect-wii-hdtv)
  (:objects
    hdmi_cord1 - hdmi_cord
    wii_av_output1 - wii_av_output
    tv1 - tv
    converter1 - converter
  )

  (:init
    (not (plugged_in_hdmi_cord hdmi_cord1))
    (not (full_av_output wii_av_output1))
    (not (full_tv tv1))
    (not (connected_converter converter1))
  )

  (:goal 
    (and 
      (connected_to_converter_tv hdmi_cord1)
      (full_tv tv1)
      (connected_converter converter1)
    )
  )
)