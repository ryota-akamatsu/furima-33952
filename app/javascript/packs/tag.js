if (location.pathname.match("items/new")){
  document.addEventListener("DOMContentLoaded", () => {
    const inputElement = document.getElementById("item_tag_relation_name");
    inputElement.addEventListener("keyup", () => {
      const keyword = document.getElementById("item_tag_relation_name").value;
      const XHR = new XMLHttpRequest();
      XHR.open("GET", `search/?keyword=${keyword}`, true);
      XHR.responseType = "json";
      XHR.send();
      XHR.onload = () => {
        const tagName = XHR.response.keyword;
        const searchResult = document.getElementById("item_tag_relation_name")
        searchResult.innerHTML = "";
        tagName.forEach((tag) => {
          const childElement = document.createElement("div");
          childElement.setAttribute("class", "child");
          childElement.setAttribute("id", tag.id);
          childElement.innerHTML = tag.name;
          searchResult.appendChild(childElement);
          const clickElement = document.getElementById(tag.id);
          clickElement.addEventListener("click", () => {
            document.getElementById("tweets_tag_name").value = clickElement.textContent;
            clickElement.remove();
        });
        });
      };
    });
  });
};