(define (problem move_Pillow1_to_Box2_with_three_object_63)
  (:domain put_task)
  (:objects
    agent1 - agent
    CellPhone4 - object
    Book1 - object
    Pen2 - object
    CD1 - object
    Watch1 - object
    CellPhone3 - object
    Box1 - receptacle
    CellPhone1 - object
    CellPhone2 - object
    Pen1 - object
    Pillow1 - object
    Sofa2 - receptacle
    Drawer1 - receptacle
    Bed1 - receptacle
    Box2 - receptacle
    GarbageCan1 - receptacle
    Desk2 - receptacle
    Bed3 - receptacle
    Sofa1 - receptacle
    Desk1 - receptacle
    Bed2 - receptacle
    Pencil1 - object
    Pencil2 - object
    Pencil3 - object
    Pencil4 - object
    Pencil5 - object
    Pencil6 - object
    Book2 - object
    Box3 - receptacle
  )

  (:init
    (atLocation agent1 GarbageCan1)
    (objectAtLocation Pillow1 Bed1)
    (objectAtLocation Pen1 GarbageCan1)
    (objectAtLocation Watch1 Desk1)
    (objectAtLocation CellPhone1 Sofa1)
    (objectAtLocation CellPhone2 Drawer1)
    (objectAtLocation CellPhone3 Bed2)
    (objectAtLocation Book1 Bed3)
    (objectAtLocation Pen2 Desk2)
    (objectAtLocation Book2 Bed3)
    (objectAtLocation Pencil5 Box1)
    (objectAtLocation Pencil1 Box2)
    (objectAtLocation Pencil4 Box2)
    (objectAtLocation Pencil3 Box2)
    (objectAtLocation Pencil6 Box3)
    (objectAtLocation Pencil2 Box1)
  )

  (:goal
    (and
      (objectAtLocation Pillow1 Box2)
    )
  )
)
