(define (problem put_CreditCard1_on_the_Sofa1_Do_not_put_it_in_Box3_83)
  (:domain put_task)
  (:objects
agent1 - agent    Pillow1 - object
    KeyChain2 - object
    KeyChain1 - object
    Book1 - object
    Watch1 - object
    Pen1 - object
    CreditCard1 - object
    KeyChain3 - object
    CreditCard2 - object
    CD1 - object
    Sofa2 - receptacle
    Sofa1 - receptacle
    Drawer3 - receptacle
    Drawer1 - receptacle
    Drawer2 - receptacle
    Desk2 - receptacle
    Desk3 - receptacle
    Desk1 - receptacle
    Drawer4 - receptacle
    Box1 - receptacle_object
    Pencil1 - object
    Box2 - receptacle_object
    Box3 - receptacle_object
    Box4 - receptacle_object
    Sofa3 - receptacle
  )

  (:init
    (atLocation agent1 Sofa1)
    (objectAtLocation CreditCard1 Desk1)
    (objectAtLocation Pillow1 Sofa1)
    (objectAtLocation Pen1 Drawer1)
    (objectAtLocation Book1 Drawer2)
    (objectAtLocation CreditCard2 Drawer3)
    (objectAtLocation KeyChain2 Sofa2)
    (objectAtLocation Watch1 Desk2)
    (objectAtLocation KeyChain3 Desk3)
    (objectAtLocation Pencil1 Drawer4)
    (objectAtLocation KeyChain1 Box1)
    (objectAtLocation Box1 Box3)
    (objectAtLocation Box2 Sofa2)
    (objectAtLocation Box3 Sofa1)
    (objectAtLocation Box4 Sofa2)
  )

  (:goal
    (and
      (objectAtLocation CreditCard1 Sofa1)
      (objectAtLocation KeyChain1 Sofa1)
      (not (objectAtLocation CreditCard1 Box3))
      (not (objectAtLocation CreditCard1 Box1))
      (not (objectAtLocation KeyChain1 Box3))
      (not (objectAtLocation KeyChain1 Box1))
    )
  )
)
