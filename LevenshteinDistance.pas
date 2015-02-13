unit LevenshteinDistance;

interface

//    function  EditDistance(const string1, string2:string) :integer;
 //   function  LevenshteinDistance2(const string1, string2:string):Double;
    function EditDistance(s, t: string): integer;

implementation

uses  System.Math ;
function EditDistance(s, t: string): integer;
var
  d : array of array of integer;
  i,j,cost : integer;
begin
  {
  Compute the edit-distance between two strings.
  Algorithm and description may be found at either of these two links:

http://en.wikipedia.org/wiki/Levenshtein_distance


http://www.google.com/search?q=Levenshtein+distance

  }

  //initialize our cost array
  SetLength(d,Length(s)+1);
  for i := Low(d) to High(d) do begin
    SetLength(d[i],Length(t)+1);
  end;

  for i := Low(d) to High(d) do begin
    d[i,0] := i;
    for j := Low(d[i]) to High(d[i]) do begin
      d[0,j] := j;
    end;
  end;

  //store our costs in a 2-d grid
  for i := Low(d)+1 to High(d) do begin
    for j := Low(d[i])+1 to High(d[i]) do begin
      if s[i] = t[j] then begin
        cost := 0;
      end
      else begin
        cost := 1;
      end;

      //to use "Min", add "Math" to your uses clause!
      d[i,j] := Min(Min(
                 d[i-1,j]+1,      //deletion
                 d[i,j-1]+1),     //insertion
                 d[i-1,j-1]+cost  //substitution
                 );
    end;  //for j
  end;  //for i

  //now that we've stored the costs, return the final one
  Result := d[Length(s),Length(t)];

  //dynamic arrays are reference counted.
  //no need to deallocate them
end;



//        function  LevenshteinDistance2(const string1, string2:string):Double;
//        begin
//
//            string1 := Utils.RemoveNonAlphaNumeric(string1);
//            string2 := Utils.RemoveNonAlphaNumeric(string2);
//
//            //int *matrix;
//            var s1Length := string1.Length;
//            var s2Length := string2.Length;
//            float result;
//
//            { Step 1 }
//            { Check string lengths }
//
//            if (string1.Length := 0) then
//            begin
//                return 0.0f;
//            end;
//
//            if (string2.Length := 0) then
//            begin
//                return 0.0f;
//            end;
//
//            { Step 2 }
//            { Allocate matrix for algorithm and fill it with default values }
//
//            var matrix := new int[s1Length + 1, s2Length + 1];
//
//            for (int i := 0; i <:= s1Length; i++) do
//            begin
//                matrix[i, 0] := i;
//            end;
//
//            for (int j := 0; j <:= s2Length; j++) do
//            begin
//                matrix[0, j] := j;
//            end;
//
//            { Step 3 }
//            { Loop through first string }
//
//            for (int i := 1; i <:= s1Length; i++) do
//            begin
//
//                { Step 4 }
//                { Loop through second string }
//
//                for (int j := 1; j <:= s2Length; j++) do
//                begin
//
//                    { Step 5 }
//                    { Calculate cost of this iteration
//                       (handles deletion, insertion, and substitution) }
//                    int cost := (string2[j - 1] := string1[i - 1]) ? 0 : 1;
//
//                    { Step 6 }
//                    { Calculate the total cost up to this point }
//
//                    matrix[i, j] := (new[] { matrix[i - 1, j] + 1, matrix[i, j - 1] + 1, matrix[i - 1, j - 1] + cost }).Min();
//                    if ((i > 1) and (j > 1) and (string1[i - 1] := string2[j - 2]) and   (string1[i - 2] := string2[j - 1])) then
//                    begin
//                        matrix[i, j] := Math.Min(matrix[i, j], matrix[i - 2, j - 2] + cost);
//                    end;
//                end;
//            end;
//
//
//            { Step 7 }
//            { Return result }
//
//            Result ::= ((float)1 - ((float)matrix[s1Length, s2Length] / (float)Math.Max(s1Length, s2Length)));
//
//            //   free(matrix);
//
//            return result;
//        end;

//        public static Int32 DamerauLevenshteinDistance(String source, String target)
//        begin
//            if (String.IsNullOrEmpty(source))
//            begin
//                if (String.IsNullOrEmpty(target))
//                begin
//                    return 0;
//                end;
//                else
//                begin
//                    return target.Length;
//                end;
//            end;
//            else
//                if (String.IsNullOrEmpty(target))
//                begin
//                    return source.Length;
//                end;
//
//            Int32 m := source.Length;
//            Int32 n := target.Length;
//            Int32[,] H := new Int32[m + 2, n + 2];
//
//            Int32 INF := m + n;
//            H[0, 0] := INF;
//            for (Int32 i := 0; i <:= m; i++)
//            begin
//                H[i + 1, 1] := i;
//                H[i + 1, 0] := INF;
//            end;
//            for (Int32 j := 0; j <:= n; j++)
//            begin
//                H[1, j + 1] := j;
//                H[0, j + 1] := INF;
//            end;
//
//            SortedDictionary<Char, Int32> sd := new SortedDictionary<Char, Int32>();
//            foreach (Char Letter in (source + target))
//            begin
//                if (!sd.ContainsKey(Letter))
//                    sd.Add(Letter, 0);
//            end;
//
//            for (Int32 i := 1; i <:= m; i++) do
//            begin
//                Int32 DB := 0;
//                for (Int32 j := 1; j <:= n; j++) do
//                begin
//                    Int32 i1 := sd[target[j - 1]];
//                    Int32 j1 := DB;
//
//                    if (source[i - 1] := target[j - 1]) then
//                    begin
//                        H[i + 1, j + 1] := H[i, j];
//                        DB := j;
//                    end
//                    else
//                    begin
//                        H[i + 1, j + 1] := Math.Min(H[i, j], Math.Min(H[i + 1, j], H[i, j + 1])) + 1;
//                    end;
//
//                    H[i + 1, j + 1] := Math.Min(H[i + 1, j + 1], H[i1, j1] + (i - i1 - 1) + 1 + (j - j1 - 1));
//                end;
//
//                sd[source[i - 1]] := i;
//            end;
//
//            Result ::= H[m + 1, n + 1];
//
//
//




end.
