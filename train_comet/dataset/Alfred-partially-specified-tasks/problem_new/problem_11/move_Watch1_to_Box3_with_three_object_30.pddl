(define (problem move_Watch1_to_Box3_with_three_object_30)
  (:domain put_task)
  (:objects
    agent1 - agent
    KeyChain1 - object
    AlarmClock1 - object
    KeyChain2 - object
    Laptop1 - object
    Book1 - object
    Watch1 - object
    CreditCard1 - object
    Box1 - receptacle
    Pencil1 - object
    CellPhone1 - object
    CellPhone2 - object
    Pillow1 - object
    Sofa2 - receptacle
    Drawer1 - receptacle
    Bed1 - receptacle
    Box2 - receptacle
    Desk2 - receptacle
    Sofa3 - receptacle
    Sofa1 - receptacle
    Desk1 - receptacle
    Bed2 - receptacle
    Box3 - receptacle
    Drawer2 - receptacle
    Pencil2 - object
    Pencil3 - object
    Pencil4 - object
    Pencil5 - object
    Pencil6 - object
  )

  (:init
    (atLocation agent1 Drawer2)
    (objectAtLocation Watch1 Drawer1)
    (objectAtLocation KeyChain1 Drawer2)
    (objectAtLocation CreditCard1 Sofa1)
    (objectAtLocation CellPhone1 Sofa2)
    (objectAtLocation CellPhone2 Bed1)
    (objectAtLocation Laptop1 Bed2)
    (objectAtLocation Pillow1 Sofa3)
    (objectAtLocation Book1 Desk2)
    (objectAtLocation KeyChain2 Bed1)
    (objectAtLocation Pencil4 Box1)
    (objectAtLocation Pencil3 Box3)
    (objectAtLocation Pencil2 Box3)
    (objectAtLocation Pencil6 Box2)
    (objectAtLocation Pencil5 Box1)
    (objectAtLocation Pencil1 Box3)
  )

  (:goal
    (and
      (objectAtLocation Watch1 Box3)
    )
  )
)
