using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.AI;
using Redcode.Pools;

public class Enemy : MonoBehaviour, IPoolObject
{
    //public Transform target;
    public string idName;
    public Vector3 targetpos;
    public Animator anim;
    bool isAtDestination;
    Rigidbody rigid;
    BoxCollider boxCollider;
    //Material mat;
    NavMeshAgent ai;


    


    void Awake()
    {
        //rigid = GetComponent<Rigidbody>();
        //boxCollider = GetComponent<BoxCollider>();
        //mat = GetComponentInChildren<MeshRenderer>().material;
        ai = GetComponent<NavMeshAgent>();
       

    }

    void Update()
    {
        //ai.SetDestination(target.position); //추적코드

        
        Vector3 relVelocity = transform.InverseTransformDirection(ai.velocity);
        relVelocity.y = 0;

        //anim.SetFloat("Idle" , relVelocity.magnitude / anim.transform.lossyScale.x);
        

        if(ai.remainingDistance <2f)
        {
            if(!isAtDestination)
            {
                OnTargetReached();

                isAtDestination = true;
            }
        }
        else
        {
            isAtDestination = false;
        }

    }

    void OnTargetReached()
    {
        GameManager.instance.ReturnPool(this);
    }

    void OnEnable() 
    {
        Init();
    }

    void Init()
    {
        transform.position = new Vector3(Random.Range(-2f , 2f), 0.7f, Random.Range(-2f, 2f));
        Transform[] spawnPos = GameManager.instance.points;
        ai.SetDestination(spawnPos[Random.Range(0, spawnPos.Length)].position);
    }

    public void OnCreatedInPool()
    {
        
    }

    public void OnGettingFromPool()
    {
        Init();
    }
}
