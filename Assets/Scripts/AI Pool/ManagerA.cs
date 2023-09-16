using UnityEngine;
using Redcode.Pools;

public class ManagerA : GameManager
{
    PoolManager poolManager;

    protected override void Awake()
    {
        base.Awake();
        poolManager = GetComponent<PoolManager>();
    }

    protected override void Spawn()
    {
        int ran = Random.Range(0, 6);
        Enemy newPlayer = poolManager.GetFromPool<Enemy>(ran);
    }

    public override void ReturnPool(Enemy clone)
    {
        poolManager.TakeToPool<Enemy>(clone.idName,  clone);
    }
   

}
