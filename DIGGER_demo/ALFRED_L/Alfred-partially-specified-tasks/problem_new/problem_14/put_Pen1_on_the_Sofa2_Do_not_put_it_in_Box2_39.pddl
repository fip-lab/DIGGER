(define (problem put_Pen1_on_the_Sofa2_Do_not_put_it_in_Box2_39)
  (:domain put_task)
  (:objects
agent1 - agent    Book2 - object
    CellPhone3 - object
    KeyChain2 - object
    KeyChain1 - object
    Book1 - object
    Watch1 - object
    Book3 - object
    Pen1 - object
    KeyChain3 - object
    Laptop1 - object
    CellPhone2 - object
    Pencil1 - object
    CellPhone1 - object
    Sofa2 - receptacle
    Sofa1 - receptacle
    Drawer3 - receptacle
    Sofa3 - receptacle
    Drawer1 - receptacle
    Drawer2 - receptacle
    Desk2 - receptacle
    Desk3 - receptacle
    Bed1 - receptacle
    Desk1 - receptacle
    Bed2 - receptacle
    Box1 - receptacle_object
    Box2 - receptacle_object
    AlarmClock1 - object
    Box3 - receptacle_object
    Box4 - receptacle_object
  )

  (:init
    (atLocation agent1 Sofa1)
    (objectAtLocation Pen1 Desk1)
    (objectAtLocation CellPhone1 Sofa1)
    (objectAtLocation Laptop1 Bed1)
    (objectAtLocation KeyChain1 Drawer1)
    (objectAtLocation Book1 Sofa2)
    (objectAtLocation CellPhone2 Bed2)
    (objectAtLocation KeyChain2 Desk2)
    (objectAtLocation KeyChain3 Sofa3)
    (objectAtLocation Book2 Drawer3)
    (objectAtLocation Book3 Desk3)
    (objectAtLocation AlarmClock1 Bed1)
    (objectAtLocation Pencil1 Box3)
    (objectAtLocation Box3 Box2)
    (objectAtLocation Box1 Sofa1)
    (objectAtLocation Box2 Sofa2)
    (objectAtLocation Box4 Sofa2)
  )

  (:goal
    (and
      (objectAtLocation Pen1 Sofa2)
      (objectAtLocation Pencil1 Sofa2)
      (not (objectAtLocation Pen1 Box2))
      (not (objectAtLocation Pen1 Box3))
      (not (objectAtLocation Pencil1 Box2))
      (not (objectAtLocation Pencil1 Box3))
    )
  )
)
