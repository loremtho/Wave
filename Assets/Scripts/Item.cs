using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[CreateAssetMenu(fileName = "New Item", menuName = "New Item/item")]
public class Item : ScriptableObject
{
    // Start is called before the first frame update
    public string itemName; //아이템 이름
    [TextArea] //다음줄 이동가능 기능
    public string itemDesc; //아이템 설명
    public ItemType itemType; //아이템의 유형
    public Sprite itemImage; //아이템 이미지
    public GameObject itemPrefab; //아이템의 프리펩

    public GameObject kitPrefab; //키트 프리펩
    public GameObject kitPreviewPrefab; //키트 프리뷰 프리펩


    public string weaponType; //무기 유형.

    public enum ItemType
    {
        Equipment,
        Used,
        Ingredient,
        Kit,
        ETC,
    }


}
