(define (problem move_CD1_to_Box3_with_three_object_56)
  (:domain put_task)
  (:objects
    agent1 - agent
    Book1 - object
    Laptop1 - object
    Book2 - object
    Box2 - receptacle
    Pen1 - object
    Book3 - object
    Box1 - receptacle
    Pencil1 - object
    CellPhone1 - object
    CellPhone2 - object
    CD1 - object
    CD2 - object
    Pillow1 - object
    Sofa2 - receptacle
    Sofa4 - receptacle
    Bed1 - receptacle
    Box4 - receptacle
    Desk2 - receptacle
    Sofa1 - receptacle
    Desk3 - receptacle
    Desk1 - receptacle
    Desk4 - receptacle
    Box3 - receptacle
    Sofa3 - receptacle
    Book4 - object
    Book5 - object
    Book6 - object
    Pencil2 - object
  )

  (:init
    (atLocation agent1 Sofa1)
    (objectAtLocation CD1 Desk1)
    (objectAtLocation CellPhone1 Sofa1)
    (objectAtLocation Pillow1 Bed1)
    (objectAtLocation Pencil1 Desk3)
    (objectAtLocation Laptop1 Sofa2)
    (objectAtLocation Pencil2 Sofa2)
    (objectAtLocation Book2 Box1)
    (objectAtLocation Book4 Box3)
    (objectAtLocation Book3 Box3)
    (objectAtLocation Book6 Box3)
    (objectAtLocation Book1 Box2)
    (objectAtLocation Book5 Box1)
  )

  (:goal
    (and
      (objectAtLocation CD1 Box3)
    )
  )
)
