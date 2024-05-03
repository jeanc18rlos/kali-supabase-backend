export type Json =
  | string
  | number
  | boolean
  | null
  | { [key: string]: Json | undefined }
  | Json[]

export type Database = {
  graphql_public: {
    Tables: {
      [_ in never]: never
    }
    Views: {
      [_ in never]: never
    }
    Functions: {
      graphql: {
        Args: {
          operationName?: string
          query?: string
          variables?: Json
          extensions?: Json
        }
        Returns: Json
      }
    }
    Enums: {
      [_ in never]: never
    }
    CompositeTypes: {
      [_ in never]: never
    }
  }
  public: {
    Tables: {
      bonus_redemptions: {
        Row: {
          bonus_amount: number
          redemption_date: string
          redemption_id: number
          user_id: string
        }
        Insert: {
          bonus_amount: number
          redemption_date: string
          redemption_id?: number
          user_id: string
        }
        Update: {
          bonus_amount?: number
          redemption_date?: string
          redemption_id?: number
          user_id?: string
        }
        Relationships: [
          {
            foreignKeyName: "fk_user"
            columns: ["user_id"]
            isOneToOne: false
            referencedRelation: "user_profiles"
            referencedColumns: ["user_id"]
          },
        ]
      }
      goals: {
        Row: {
          effective_date: string
          goal_id: number
          is_active: boolean | null
          steps_goal: number | null
          user_id: string | null
        }
        Insert: {
          effective_date: string
          goal_id?: number
          is_active?: boolean | null
          steps_goal?: number | null
          user_id?: string | null
        }
        Update: {
          effective_date?: string
          goal_id?: number
          is_active?: boolean | null
          steps_goal?: number | null
          user_id?: string | null
        }
        Relationships: [
          {
            foreignKeyName: "goals_user_id_fkey"
            columns: ["user_id"]
            isOneToOne: false
            referencedRelation: "user_profiles"
            referencedColumns: ["user_id"]
          },
        ]
      }
      kali_levels: {
        Row: {
          id: number
          image_url: string
          level_name: string
          motivational_quote: string
          reward: number
          step_count_to_next_level: number
        }
        Insert: {
          id?: number
          image_url: string
          level_name: string
          motivational_quote: string
          reward: number
          step_count_to_next_level: number
        }
        Update: {
          id?: number
          image_url?: string
          level_name?: string
          motivational_quote?: string
          reward?: number
          step_count_to_next_level?: number
        }
        Relationships: []
      }
      kali_subscriptions: {
        Row: {
          daily_points_limit: number
          id: number
          subscription_name: string
        }
        Insert: {
          daily_points_limit: number
          id?: number
          subscription_name: string
        }
        Update: {
          daily_points_limit?: number
          id?: number
          subscription_name?: string
        }
        Relationships: []
      }
      steps: {
        Row: {
          created_at: string | null
          last_update: string
          step_count: number | null
          steps_id: number
          user_id: string | null
        }
        Insert: {
          created_at?: string | null
          last_update: string
          step_count?: number | null
          steps_id?: number
          user_id?: string | null
        }
        Update: {
          created_at?: string | null
          last_update?: string
          step_count?: number | null
          steps_id?: number
          user_id?: string | null
        }
        Relationships: [
          {
            foreignKeyName: "steps_user_id_fkey"
            columns: ["user_id"]
            isOneToOne: false
            referencedRelation: "user_profiles"
            referencedColumns: ["user_id"]
          },
        ]
      }
      streaks: {
        Row: {
          best_streak: number | null
          current_streak: number | null
          last_update: string
          streak_id: number
          user_id: string | null
        }
        Insert: {
          best_streak?: number | null
          current_streak?: number | null
          last_update: string
          streak_id?: number
          user_id?: string | null
        }
        Update: {
          best_streak?: number | null
          current_streak?: number | null
          last_update?: string
          streak_id?: number
          user_id?: string | null
        }
        Relationships: [
          {
            foreignKeyName: "streaks_user_id_fkey"
            columns: ["user_id"]
            isOneToOne: false
            referencedRelation: "user_profiles"
            referencedColumns: ["user_id"]
          },
        ]
      }
      subscriptions: {
        Row: {
          kali_subscription_id: number | null
          max_daily_steps: number | null
          subscription_id: number
          user_id: string | null
        }
        Insert: {
          kali_subscription_id?: number | null
          max_daily_steps?: number | null
          subscription_id?: number
          user_id?: string | null
        }
        Update: {
          kali_subscription_id?: number | null
          max_daily_steps?: number | null
          subscription_id?: number
          user_id?: string | null
        }
        Relationships: [
          {
            foreignKeyName: "subscriptions_kali_subscription_id_fkey"
            columns: ["kali_subscription_id"]
            isOneToOne: false
            referencedRelation: "kali_subscriptions"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "subscriptions_user_id_fkey"
            columns: ["user_id"]
            isOneToOne: false
            referencedRelation: "user_profiles"
            referencedColumns: ["user_id"]
          },
        ]
      }
      user_levels: {
        Row: {
          current_level: number | null
          current_points: number | null
          level_id: number
          points_to_next_level: number | null
          user_id: string | null
        }
        Insert: {
          current_level?: number | null
          current_points?: number | null
          level_id?: number
          points_to_next_level?: number | null
          user_id?: string | null
        }
        Update: {
          current_level?: number | null
          current_points?: number | null
          level_id?: number
          points_to_next_level?: number | null
          user_id?: string | null
        }
        Relationships: [
          {
            foreignKeyName: "user_levels_user_id_fkey"
            columns: ["user_id"]
            isOneToOne: false
            referencedRelation: "user_profiles"
            referencedColumns: ["user_id"]
          },
        ]
      }
      user_profiles: {
        Row: {
          bio: string | null
          birthdate_calendar_date: string | null
          created_at: string | null
          email: string
          name: string | null
          phone_number: string | null
          profile_image_url: string | null
          timezone: string
          user_id: string
        }
        Insert: {
          bio?: string | null
          birthdate_calendar_date?: string | null
          created_at?: string | null
          email: string
          name?: string | null
          phone_number?: string | null
          profile_image_url?: string | null
          timezone: string
          user_id?: string
        }
        Update: {
          bio?: string | null
          birthdate_calendar_date?: string | null
          created_at?: string | null
          email?: string
          name?: string | null
          phone_number?: string | null
          profile_image_url?: string | null
          timezone?: string
          user_id?: string
        }
        Relationships: []
      }
    }
    Views: {
      [_ in never]: never
    }
    Functions: {
      get_leaderboard: {
        Args: {
          _user_id: string
          _timezone: string
          _period: string
          _limit?: number
        }
        Returns: {
          user_position: number
          user_profile_image: string
          name: string
          steps: number
          is_current_user: boolean
        }[]
      }
      get_user_dashboard: {
        Args: {
          dashboard_user_id: string
          dashboard_user_timezone?: string
        }
        Returns: {
          user_id: string
          name: string
          profile_image_url: string
          steps_today: number
          goal_today: number
          current_level: number
          current_points: number
          points_to_next_level: number
          current_streak: number
          weekly_streak: string[]
          last_update: string
        }[]
      }
      get_user_future_levels: {
        Args: {
          _user_id: string
          _timezone: string
          _limit?: number
        }
        Returns: {
          id: number
          level_name: string
          image_url: string
          motivational_quote: string
          reward: number
          step_count_to_next_level: number
        }[]
      }
      redeem_daily_bonus: {
        Args: {
          _user_id: string
          _timezone: string
        }
        Returns: {
          status: string
          message: string
        }[]
      }
      set_daily_goal: {
        Args: {
          _user_id: string
          _goal: number
          _user_timezone: string
        }
        Returns: undefined
      }
      update_steps: {
        Args: {
          _user_id: string
          _steps: number
          _user_timezone: string
        }
        Returns: undefined
      }
      update_streak: {
        Args: {
          _user_id: string
          _today: string
        }
        Returns: undefined
      }
    }
    Enums: {
      [_ in never]: never
    }
    CompositeTypes: {
      [_ in never]: never
    }
  }
  storage: {
    Tables: {
      buckets: {
        Row: {
          allowed_mime_types: string[] | null
          avif_autodetection: boolean | null
          created_at: string | null
          file_size_limit: number | null
          id: string
          name: string
          owner: string | null
          owner_id: string | null
          public: boolean | null
          updated_at: string | null
        }
        Insert: {
          allowed_mime_types?: string[] | null
          avif_autodetection?: boolean | null
          created_at?: string | null
          file_size_limit?: number | null
          id: string
          name: string
          owner?: string | null
          owner_id?: string | null
          public?: boolean | null
          updated_at?: string | null
        }
        Update: {
          allowed_mime_types?: string[] | null
          avif_autodetection?: boolean | null
          created_at?: string | null
          file_size_limit?: number | null
          id?: string
          name?: string
          owner?: string | null
          owner_id?: string | null
          public?: boolean | null
          updated_at?: string | null
        }
        Relationships: []
      }
      migrations: {
        Row: {
          executed_at: string | null
          hash: string
          id: number
          name: string
        }
        Insert: {
          executed_at?: string | null
          hash: string
          id: number
          name: string
        }
        Update: {
          executed_at?: string | null
          hash?: string
          id?: number
          name?: string
        }
        Relationships: []
      }
      objects: {
        Row: {
          bucket_id: string | null
          created_at: string | null
          id: string
          last_accessed_at: string | null
          metadata: Json | null
          name: string | null
          owner: string | null
          owner_id: string | null
          path_tokens: string[] | null
          updated_at: string | null
          version: string | null
        }
        Insert: {
          bucket_id?: string | null
          created_at?: string | null
          id?: string
          last_accessed_at?: string | null
          metadata?: Json | null
          name?: string | null
          owner?: string | null
          owner_id?: string | null
          path_tokens?: string[] | null
          updated_at?: string | null
          version?: string | null
        }
        Update: {
          bucket_id?: string | null
          created_at?: string | null
          id?: string
          last_accessed_at?: string | null
          metadata?: Json | null
          name?: string | null
          owner?: string | null
          owner_id?: string | null
          path_tokens?: string[] | null
          updated_at?: string | null
          version?: string | null
        }
        Relationships: [
          {
            foreignKeyName: "objects_bucketId_fkey"
            columns: ["bucket_id"]
            isOneToOne: false
            referencedRelation: "buckets"
            referencedColumns: ["id"]
          },
        ]
      }
      s3_multipart_uploads: {
        Row: {
          bucket_id: string
          created_at: string
          id: string
          in_progress_size: number
          key: string
          owner_id: string | null
          upload_signature: string
          version: string
        }
        Insert: {
          bucket_id: string
          created_at?: string
          id: string
          in_progress_size?: number
          key: string
          owner_id?: string | null
          upload_signature: string
          version: string
        }
        Update: {
          bucket_id?: string
          created_at?: string
          id?: string
          in_progress_size?: number
          key?: string
          owner_id?: string | null
          upload_signature?: string
          version?: string
        }
        Relationships: [
          {
            foreignKeyName: "s3_multipart_uploads_bucket_id_fkey"
            columns: ["bucket_id"]
            isOneToOne: false
            referencedRelation: "buckets"
            referencedColumns: ["id"]
          },
        ]
      }
      s3_multipart_uploads_parts: {
        Row: {
          bucket_id: string
          created_at: string
          etag: string
          id: string
          key: string
          owner_id: string | null
          part_number: number
          size: number
          upload_id: string
          version: string
        }
        Insert: {
          bucket_id: string
          created_at?: string
          etag: string
          id?: string
          key: string
          owner_id?: string | null
          part_number: number
          size?: number
          upload_id: string
          version: string
        }
        Update: {
          bucket_id?: string
          created_at?: string
          etag?: string
          id?: string
          key?: string
          owner_id?: string | null
          part_number?: number
          size?: number
          upload_id?: string
          version?: string
        }
        Relationships: [
          {
            foreignKeyName: "s3_multipart_uploads_parts_bucket_id_fkey"
            columns: ["bucket_id"]
            isOneToOne: false
            referencedRelation: "buckets"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "s3_multipart_uploads_parts_upload_id_fkey"
            columns: ["upload_id"]
            isOneToOne: false
            referencedRelation: "s3_multipart_uploads"
            referencedColumns: ["id"]
          },
        ]
      }
    }
    Views: {
      [_ in never]: never
    }
    Functions: {
      can_insert_object: {
        Args: {
          bucketid: string
          name: string
          owner: string
          metadata: Json
        }
        Returns: undefined
      }
      extension: {
        Args: {
          name: string
        }
        Returns: string
      }
      filename: {
        Args: {
          name: string
        }
        Returns: string
      }
      foldername: {
        Args: {
          name: string
        }
        Returns: string[]
      }
      get_size_by_bucket: {
        Args: Record<PropertyKey, never>
        Returns: {
          size: number
          bucket_id: string
        }[]
      }
      list_multipart_uploads_with_delimiter: {
        Args: {
          bucket_id: string
          prefix_param: string
          delimiter_param: string
          max_keys?: number
          next_key_token?: string
          next_upload_token?: string
        }
        Returns: {
          key: string
          id: string
          created_at: string
        }[]
      }
      list_objects_with_delimiter: {
        Args: {
          bucket_id: string
          prefix_param: string
          delimiter_param: string
          max_keys?: number
          start_after?: string
          next_token?: string
        }
        Returns: {
          name: string
          id: string
          metadata: Json
          updated_at: string
        }[]
      }
      search: {
        Args: {
          prefix: string
          bucketname: string
          limits?: number
          levels?: number
          offsets?: number
          search?: string
          sortcolumn?: string
          sortorder?: string
        }
        Returns: {
          name: string
          id: string
          updated_at: string
          created_at: string
          last_accessed_at: string
          metadata: Json
        }[]
      }
    }
    Enums: {
      [_ in never]: never
    }
    CompositeTypes: {
      [_ in never]: never
    }
  }
}

type PublicSchema = Database[Extract<keyof Database, "public">]

export type Tables<
  PublicTableNameOrOptions extends
    | keyof (PublicSchema["Tables"] & PublicSchema["Views"])
    | { schema: keyof Database },
  TableName extends PublicTableNameOrOptions extends { schema: keyof Database }
    ? keyof (Database[PublicTableNameOrOptions["schema"]]["Tables"] &
        Database[PublicTableNameOrOptions["schema"]]["Views"])
    : never = never,
> = PublicTableNameOrOptions extends { schema: keyof Database }
  ? (Database[PublicTableNameOrOptions["schema"]]["Tables"] &
      Database[PublicTableNameOrOptions["schema"]]["Views"])[TableName] extends {
      Row: infer R
    }
    ? R
    : never
  : PublicTableNameOrOptions extends keyof (PublicSchema["Tables"] &
        PublicSchema["Views"])
    ? (PublicSchema["Tables"] &
        PublicSchema["Views"])[PublicTableNameOrOptions] extends {
        Row: infer R
      }
      ? R
      : never
    : never

export type TablesInsert<
  PublicTableNameOrOptions extends
    | keyof PublicSchema["Tables"]
    | { schema: keyof Database },
  TableName extends PublicTableNameOrOptions extends { schema: keyof Database }
    ? keyof Database[PublicTableNameOrOptions["schema"]]["Tables"]
    : never = never,
> = PublicTableNameOrOptions extends { schema: keyof Database }
  ? Database[PublicTableNameOrOptions["schema"]]["Tables"][TableName] extends {
      Insert: infer I
    }
    ? I
    : never
  : PublicTableNameOrOptions extends keyof PublicSchema["Tables"]
    ? PublicSchema["Tables"][PublicTableNameOrOptions] extends {
        Insert: infer I
      }
      ? I
      : never
    : never

export type TablesUpdate<
  PublicTableNameOrOptions extends
    | keyof PublicSchema["Tables"]
    | { schema: keyof Database },
  TableName extends PublicTableNameOrOptions extends { schema: keyof Database }
    ? keyof Database[PublicTableNameOrOptions["schema"]]["Tables"]
    : never = never,
> = PublicTableNameOrOptions extends { schema: keyof Database }
  ? Database[PublicTableNameOrOptions["schema"]]["Tables"][TableName] extends {
      Update: infer U
    }
    ? U
    : never
  : PublicTableNameOrOptions extends keyof PublicSchema["Tables"]
    ? PublicSchema["Tables"][PublicTableNameOrOptions] extends {
        Update: infer U
      }
      ? U
      : never
    : never

export type Enums<
  PublicEnumNameOrOptions extends
    | keyof PublicSchema["Enums"]
    | { schema: keyof Database },
  EnumName extends PublicEnumNameOrOptions extends { schema: keyof Database }
    ? keyof Database[PublicEnumNameOrOptions["schema"]]["Enums"]
    : never = never,
> = PublicEnumNameOrOptions extends { schema: keyof Database }
  ? Database[PublicEnumNameOrOptions["schema"]]["Enums"][EnumName]
  : PublicEnumNameOrOptions extends keyof PublicSchema["Enums"]
    ? PublicSchema["Enums"][PublicEnumNameOrOptions]
    : never

