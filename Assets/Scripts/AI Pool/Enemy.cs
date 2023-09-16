using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.AI;

public class Enemy : MonoBehaviour
{
    public Transform target;
    Rigidbody rigid;
    BoxCollider boxCollider;
    //Material mat;
    NavMeshAgent nav;


    void Awake()
    {
        rigid = GetComponent<Rigidbody>();
        boxCollider = GetComponent<BoxCollider>();
        //mat = GetComponentInChildren<MeshRenderer>().material;
        nav = GetComponent<NavMeshAgent>();

    }

    void Update()
    {
        nav.SetDestination(target.position);

    }




}
