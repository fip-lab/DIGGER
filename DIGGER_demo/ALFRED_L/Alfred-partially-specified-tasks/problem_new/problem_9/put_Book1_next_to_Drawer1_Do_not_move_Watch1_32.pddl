(define (problem put_Book1_next_to_Drawer1_Do_not_move_Watch1_32)
  (:domain put_task)
  (:objects
    agent1 - agent
    CellPhone1 - object
    Watch2 - object
    Book1 - object
    AlarmClock1 - object
    Pencil2 - object
    Laptop2 - object
    CreditCard1 - object
    Laptop1 - object
    Watch1 - object
    KeyChain1 - object
    Book3 - object
    Pencil1 - object
    Book2 - object
    Pen1 - object
    Sofa2 - receptacle
    Desk4 - receptacle
    Drawer1 - receptacle
    Desk2 - receptacle
    Sofa1 - receptacle
    Desk1 - receptacle
    Bed1 - receptacle
    Desk6 - receptacle
    Desk7 - receptacle
    Sofa3 - receptacle
    Desk3 - receptacle
    GarbageCan1 - receptacle
    Drawer2 - receptacle
    Desk5 - receptacle
    Candle1 - object
    Book4 - object
    Book5 - object
    KeyChain2 - object
    Pen2 - object
    Floor1 - receptacle
  )

  (:init
    (atLocation agent1 Drawer1)
    (objectAtLocation Book1 Desk1)
    (objectAtLocation Watch1 Drawer1)
    (objectAtLocation Book2 Bed1)
    (objectAtLocation CellPhone1 Desk2)
    (objectAtLocation AlarmClock1 Desk3)
    (objectAtLocation KeyChain1 Sofa1)
    (objectAtLocation Pen1 GarbageCan1)
    (objectAtLocation Book3 Sofa2)
    (objectAtLocation Pencil1 Desk4)
    (objectAtLocation Laptop1 Desk5)
    (objectAtLocation CreditCard1 Desk6)
    (objectAtLocation Watch2 Desk7)
    (objectAtLocation Laptop2 Sofa3)
    (objectAtLocation Pencil2 Drawer2)
    (objectAtLocation Candle1 Drawer1)
    (objectAtLocation Book4 Desk6)
    (objectAtLocation Book5 Desk4)
    (objectAtLocation KeyChain2 Desk3)
    (objectAtLocation Pen2 Desk4)
  )

  (:goal
    (and
      (objectAtLocation Watch1 Drawer1)
      (objectAtLocation Book1 Drawer1)
    )
  )
)
