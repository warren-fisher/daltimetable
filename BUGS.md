# Bugs


## Search doesnt work
1. Search for anything, it doesnt update properly
2. The like %% operators
3. The term buttons don't update search
4. Search might be delayed by 1 refresh?? (think fixed)
5. Search term updates 1-2 refresh later?
6. Confirmed, clicking term button does not refresh search state
7. Once the button is changed then it updates on next getApiState()
8. Passed down handleUpdate, now it calls it but state is 1 refresh behind

SearchState is not passed right classes selected arr
apiGetResponse state or whatever in mainComp not working