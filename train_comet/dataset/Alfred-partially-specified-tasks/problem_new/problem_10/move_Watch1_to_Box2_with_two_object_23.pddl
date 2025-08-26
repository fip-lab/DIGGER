(define (problem move_Watch1_to_Box2_with_two_object_23)
  (:domain put_task)
  (:objects
    agent1 - agent
    CellPhone1 - object
    Box1 - receptacle
    Laptop2 - object
    Watch1 - object
    Pillow1 - object
    Laptop1 - object
    Pencil1 - object
    CreditCard2 - object
    CellPhone2 - object
    AlarmClock1 - object
    Book1 - object
    Laptop3 - object
    Pen1 - object
    CreditCard1 - object
    Bed1 - receptacle
    Drawer1 - receptacle
    Desk3 - receptacle
    Sofa2 - receptacle
    Bed2 - receptacle
    Desk4 - receptacle
    Desk1 - receptacle
    Sofa1 - receptacle
    Desk5 - receptacle
    GarbageCan1 - receptacle
    Desk6 - receptacle
    Drawer3 - receptacle
    Drawer2 - receptacle
    Desk2 - receptacle
    KeyChain1 - object
    KeyChain2 - object
    KeyChain3 - object
    Box2 - receptacle
  )

  (:init
    (atLocation agent1 Bed1)
    (objectAtLocation Watch1 Desk1)
    (objectAtLocation Pillow1 Bed1)
    (objectAtLocation Laptop1 Desk2)
    (objectAtLocation CellPhone1 Drawer1)
    (objectAtLocation AlarmClock1 Desk3)
    (objectAtLocation Laptop2 Bed2)
    (objectAtLocation Laptop3 Sofa1)
    (objectAtLocation Book1 Desk5)
    (objectAtLocation CreditCard1 Drawer2)
    (objectAtLocation Pen1 Drawer3)
    (objectAtLocation CreditCard2 Sofa2)
    (objectAtLocation Pencil1 GarbageCan1)
    (objectAtLocation CellPhone2 Desk6)
    (objectAtLocation KeyChain2 Box2)
    (objectAtLocation KeyChain3 Box1)
    (objectAtLocation KeyChain1 Box2)
  )

  (:goal
    (and
      (objectAtLocation Watch1 Box2)
    )
  )
)
