(define (domain PaintRemoval)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    item
    window tool liquid container cloth solvent
    ; Subtypes
    razor_blade_package - container
    razor_blade - tool
    sponge - tool
    bucket - container
    glass_cleaner_bottle - container
    soap_bottle - container
  )

  (:predicates
    ; Window predicates
    (dry ?w - window)
    (wet ?w - window)
    (clean ?w - window)
    (dirty ?w - window)
    (contains_paint ?w - window)
    (contains_splatters ?w - window)
    (transparent ?w - window)
    (opaque ?w - window)

    ; Tool predicates
    (in_hand ?t - tool)
    (clean_tool ?t - tool)
    (dirty_tool ?t - tool)

    ; Razor blade package predicates
    (closed ?rp - razor_blade_package)
    (open ?rp - razor_blade_package)

    ; Container predicates
    (full ?c - container)
    (empty ?c - container)

    ; Liquid predicates
    (mixed ?b - bucket)
    (has_glass_cleaner ?gcb - glass_cleaner_bottle)
    (has_soap ?sb - soap_bottle)
    (has_solvent ?s - solvent)

    ; Cloth predicates
    (clean_cloth ?c - cloth)
    (dirty_cloth ?c - cloth)
  )

  ;;; Action 1: Gather Items Needed
  (:action gather_items
    :parameters (?items - item)
    :precondition (not (in_hand ?items))
    :effect (in_hand ?items)
  )

  ;;; Action 2: Mix Soap and Water in Bucket
  (:action mix_soap_and_water
    :parameters (?b - bucket ?sb - soap_bottle)
    :precondition (and
      (empty ?b)
      (full ?sb)
    )
    :effect (and
      (mixed ?b)
      (not (empty ?b))
      (not (full ?sb))
    )
  )

  ;;; Action 3: Wet the Window with Soap Solution
  (:action wet_window
    :parameters (?w - window ?b - bucket ?s - sponge)
    :precondition (and
      (dry ?w)
      (mixed ?b)
      (clean_tool ?s)
    )
    :effect (and
      (wet ?w)
      (not (dry ?w))
      (dirty_tool ?s)
    )
  )

  ;;; Action 4: Open Razor Blade Package
  (:action open_razor_blade_package
    :parameters (?rp - razor_blade_package ?rb - razor_blade)
    :precondition (and
      (closed ?rp)
      (not (in_hand ?rb))
    )
    :effect (and
      (open ?rp)
      (in_hand ?rb)
      (not (closed ?rp))
    )
  )

  ;;; Action 5: Scrape Paint from Window
  (:action scrape_paint
    :parameters (?w - window ?rb - razor_blade)
    :precondition (and
      (wet ?w)
      (in_hand ?rb)
      (contains_paint ?w)
    )
    :effect (and
      (not (contains_paint ?w))
      (dirty_tool ?rb)
      (clean ?w)
    )
  )

  ;;; Action 6: Spritz Window with Glass Cleaner
  (:action spritz_glass_cleaner
    :parameters (?w - window ?gcb - glass_cleaner_bottle)
    :precondition (and
      (not (contains_paint ?w))
      (has_glass_cleaner ?gcb)
      (not (opaque ?w))
    )
    :effect (and
      (opaque ?w)
      (not (has_glass_cleaner ?gcb))
    )
  )

  ;;; Action 7: Buff Window with Cloth
  (:action buff_window
    :parameters (?w - window ?c - cloth)
    :precondition (and
      (opaque ?w)
      (clean_cloth ?c)
    )
    :effect (and
      (transparent ?w)
      (dirty_cloth ?c)
      (not (opaque ?w))
    )
  )

  ;;; Action 8: Remove Small Paint Splatters with Solvent
  (:action remove_splatters_with_solvent
    :parameters (?w - window ?s - solvent)
    :precondition (and
      (contains_splatters ?w)
      (has_solvent ?s)
    )
    :effect (and
      (not (contains_splatters ?w))
      (not (has_solvent ?s))
    )
  )
)
